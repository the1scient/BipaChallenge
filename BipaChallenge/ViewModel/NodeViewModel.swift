//
//  NodeViewModel.swift
//  BipaChallenge
//
//  Created by Guilherme Fabbri on 09/01/26.
//

import Foundation
import Combine


final class NodeViewModel : ObservableObject {
    
    @Published var nodes : [Node] = []
    @Published var isLoading : Bool = false
    @Published var errorMsg : String? = nil
    
  
    func fetchNodes() {
        isLoading = true
        
        guard let url = URL(string: "https://mempool.space/api/v1/lightning/nodes/rankings/connectivity") else { return }
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        print("API chamada")
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
                
            if let error = error {
                print("Erro: ", error)
                self.errorMsg = "\(error)"
                self.isLoading = false
                return
            }
            
            guard let data = data else {
                print("Sem resultados")
                self.errorMsg = "Nada para exibir..."
                self.isLoading = false
                return
            }
            
            do {
                let nodes = try JSONDecoder().decode([Node].self, from: data)
                DispatchQueue.main.async {
                    self.isLoading = false
                    self.nodes = nodes
                }
                
                
            }
            
            catch {
                print("Erro ao fazer JSON decode: ", error)
                self.isLoading = false
            }
            
            
            
        }
        
        task.resume()
        
    }
    
    
    
}

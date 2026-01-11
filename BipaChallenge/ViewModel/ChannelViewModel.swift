//
//  ChannelViewModel.swift
//  BipaChallenge
//
//  Created by Guilherme Fabbri on 11/01/26.
//

import Foundation
import Combine


final class ChannelViewModel : ObservableObject {
    
    @Published var channelLocation : [ChannelLocation] = []
    @Published var isLoading : Bool = false
    @Published var errorMsg : String? = nil
    
    func fetchChannelGeodata(publicKey : String) {
        isLoading = true
        
        guard let url = URL(string: "https://mempool.space/api/v1/lightning/channels-geo/\(publicKey)") else { return }
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        print("API Geodata chamada")
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
                let json = try JSONSerialization.jsonObject(with: data) as! [[Any]]
                
                var locations: [ChannelLocation] = []
                for array in json {
                    let name = array[5] as! String
                    let longitude = array[2] as! Double
                    let latitude = array[3] as! Double
                    
                    let location = ChannelLocation(name: name, latitude: latitude, longitude: longitude)
                    locations.append(location)
                }
                
                DispatchQueue.main.async {
                    self.channelLocation = locations
                    print(self.channelLocation)
                    self.isLoading = false
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

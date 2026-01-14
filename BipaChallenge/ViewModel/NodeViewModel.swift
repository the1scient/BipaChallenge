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
    @Published var errorMsg : String?
    
    let apiClient = APIClient()
    var cancellable : AnyCancellable?
    
    
    func fetchNodes() {
        isLoading = true
        errorMsg = nil
        
        cancellable = apiClient.nodes()
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { [weak self] completion in
                    self?.isLoading = false
                    
                    if case .failure(let error) = completion {
                        self?.errorMsg = "\(error)"
                    }
                },
                receiveValue: { [weak self] nodes in
                    self?.nodes = nodes
                }
            )
    }
    
    
}

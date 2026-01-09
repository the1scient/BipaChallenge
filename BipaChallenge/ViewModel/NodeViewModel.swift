//
//  NodeViewModel.swift
//  BipaChallenge
//
//  Created by Guilherme Fabbri on 09/01/26.
//

import Foundation
import Combine


final class NodeViewModel : ObservableObject {
    
    @Published var nodes : [Node]
    @Published var isLoading : Bool
    @Published var errorMsg : String
    
    init(nodes: [Node], isLoading: Bool, errorMsg: String) {
        self.nodes = nodes
        self.isLoading = isLoading
        self.errorMsg = errorMsg
    }
    
  
    
    
    
}

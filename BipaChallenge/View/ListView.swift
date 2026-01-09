//
//  ListView.swift
//  BipaChallenge
//
//  Created by Guilherme Fabbri on 08/01/26.
//
import SwiftUI

struct ListView : View {
    
    @StateObject var vm = NodeViewModel()

    var body : some View {
        
        ZStack {
            // TODO: List sorting picker
            
            
            if vm.isLoading {
                ProgressView("Buscando dados da API...")
            }
            else if let error = vm.errorMsg {
                Text("Erro ao buscar dados da API: \(error)")
            }
            else {
                List {
                    ForEach(vm.nodes) { node in
                        
                        ListItemComponent(node: node)
                        
                        
                        
                        
                    }
                }
                
            }
            
            
            
        }
        .task {
            vm.fetchNodes()
        }
    }
       
    
}
    

#Preview() {
    ListView()
}

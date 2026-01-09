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
        
        // TODO: List sorting picker
        
        List {
            ForEach(vm.nodes) { node in
                
                ListItemComponent(node: node)
                
                
                
                
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

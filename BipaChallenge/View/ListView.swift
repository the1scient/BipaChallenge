//
//  ListView.swift
//  BipaChallenge
//
//  Created by Guilherme Fabbri on 08/01/26.
//
import SwiftUI

struct ListView : View {
    
    let nodes : [Node] = [Node(
        id: "03864ef025fde8fb587d989186ce6a4a186895ee44a926bfc370e2c366597a3f8f0",
        alias: "TEST",
        channels: 1923,
        capacity: 37101048354,
        firstSeen: 1522941222,
        updatedAt: 1767917849,
        city: nil,
        country: nil
    ),
  Node(
      id: "03864ef025fde8fb587d989186ce6a4a186895ee44a926bfc370e2c366597a3f8f",
      alias: "TESTE2",
      channels: 1923,
      capacity: 8129127,
      firstSeen: 1522341222,
      updatedAt: 1764917849,
      city: nil,
      country: nil
  )
    
    ]
    
    var body : some View {
        
        // TODO: List sorting picker
        
        List {
            ForEach(nodes) { node in
                
                ListItemComponent(node: node)
                
                
                
                
            }
        }
        
        
        
        
    }
    
}

#Preview() {
    ListView()
}

//
//  ListDetailView.swift
//  BipaChallenge
//
//  Created by Guilherme Fabbri on 08/01/26.
//

import SwiftUI

struct ListDetailsView : View {
    let node : Node

    var body : some View {
        VStack {
            Text("\(node.alias)")
        }
       
    }
    
}

#Preview {
    ListDetailsView(node: Node(
        publicKey: "03864ef025fde8fb587d989186ce6a4a186895ee44a926bfc370e2c366597a3f8f",
        alias: "ACINQ",
        channels: 1923,
        capacity: 37101048354,
        firstSeen: NSDate(timeIntervalSince1970: 1522941222) as Date,
        updatedAt: NSDate(timeIntervalSince1970: 1767917849) as Date,
        city: nil,
        country: nil
    ))
}

//
//  ListItemComponent.swift
//  BipaChallenge
//
//  Created by Guilherme Fabbri on 08/01/26.
//

import SwiftUI

struct ListItemComponent : View {
    
    let node : Node
    
    var body : some View {
        NavigationLink(destination: ListDetailsView(node: node)) {
            VStack(alignment: .leading) {
                
                Text(node.alias)
                    .font(.title)
                    .accessibilityIdentifier("alias_\(node.alias)")
                
                Text("📍 \(node.cityName), \(node.countryName)")
                    .font(.caption)
                
                Text("PublicKey: \(node.publicKey)")
                    .lineLimit(1)
                
                Text("Capacidade: \(node.capacity / 100000000) BTC")
                
                Text("Canais: \(node.channels)")
                
                
                Spacer()
                
                
                Text("Atualizado em: \(node.updatedAt, format: .dateTime.day().month().year())")
                    .environment(\.locale, Locale(identifier: "pt-BR"))
                    .font(.caption)
                
                Text("Público em: \(node.firstSeen, format: .dateTime.day().month().year())")
                    .environment(\.locale, Locale(identifier: "pt-BR"))
                    .font(.caption)
                
            }
        }
    }
    
}

#Preview {
    ListItemComponent(node: Node(
        publicKey: "03864ef025fde8fb587d989186ce6a4a186895ee44a926bfc370e2c366597a3f8f",
        alias: "ACINQ",
        channels: 1923,
        capacity: 37101048354,
        firstSeen: NSDate(timeIntervalSince1970: 1522941222) as Date,
        updatedAt: NSDate(timeIntervalSince1970: 1767917849) as Date,
        city: nil,
        country: nil,
        iso_code: "US"
    ))
}

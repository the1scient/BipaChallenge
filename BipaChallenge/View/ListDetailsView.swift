//
//  ListDetailView.swift
//  BipaChallenge
//
//  Created by Guilherme Fabbri on 08/01/26.
//

import SwiftUI
import MapKit

struct ListDetailsView : View {
    let node : Node

    var body : some View {
        VStack(alignment: .leading) {
            
            HStack(spacing: 10) {
                Text("\(node.countryFlag)")
                    .font(.largeTitle)
               
                
                Text(node.alias)
                    .font(.largeTitle)
                    .fontWeight(.bold)
            }
            
            
            Text("📍 \(node.cityName), \(node.countryName)")
                .font(.caption)
        
        
            HStack(spacing: 20) {
                Text("Capacidade: \n \(node.capacity / 100000000) BTC")
                    .frame(maxWidth: .infinity, maxHeight: 60)
                    .background(.gray)
                    .foregroundStyle(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding()
                    
                
                
                Text("Canais: \n \(node.channels)")
                    .frame(maxWidth: .infinity, maxHeight: 60)
                    .background(.gray)
                    .foregroundStyle(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding()
                    
                    

            }
        
            
        Spacer()
                .frame(height: 20)
            
        Text("PublicKey:")
                .font(.caption)
                .foregroundStyle(.secondary)
            
        Text("\(node.publicKey)")
                .textSelection(.enabled)
                .font(.footnote)
            
            Spacer()
                    .frame(height: 20)
            
        Text("Atualizado em: ")
                .font(.caption)
                .foregroundStyle(.secondary)
            
        Text("\(node.updatedAt, format: .dateTime.day().month().year())")
            .environment(\.locale, Locale(identifier: "pt-BR"))
            .font(.footnote)
        
        Text("Público em: ")
                .font(.caption)
                .foregroundStyle(.secondary)
            
        Text("\(node.firstSeen, format: .dateTime.day().month().year())")
            .environment(\.locale, Locale(identifier: "pt-BR"))
            .font(.footnote)
            .textSelection(.enabled)
            
            Spacer()
                .frame(height: 100)
            
            NavigationLink(destination: MapView(publicKey: node.publicKey)) {
                Text("Ver no mapa")
                    .frame(maxWidth: .infinity)
                       .padding()
                       .background(.blue)
                       .foregroundStyle(.white)
                       .clipShape(RoundedRectangle(cornerRadius: 10))
                
                
            }
            
        }
        .padding()
       
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
        country: nil,
        iso_code: "US"
    ))
}

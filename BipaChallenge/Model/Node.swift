//
//  Node.swift
//  BipaChallenge
//
//  Created by Guilherme Fabbri on 08/01/26.
//
import Foundation

struct Node : Identifiable, Decodable {
        
    let publicKey: String
    let alias: String
    let channels: Int
    let capacity: Int
    let firstSeen: Date
    let updatedAt: Date
    let city: [String:String]?
    let country: [String:String]?
    let iso_code: String?
    
    var id : String {
        publicKey
    }
    
    var cityName : String {
        city?["pt-BR"] ?? city?["en"] ?? "Desconhecida" // Just learned that you can have unlimited "fallbacks". So, if city["pt-BR"] does NOT exists, it defaults to city["en"], and if city["en"] doesn't exist aswell, it defaults to "Desconhecido".
    }
    
    var countryName : String {
        country?["pt-BR"] ?? country?["en"] ?? "Desconhecido"
    }
    
    var countryFlag: String {
        guard let code = iso_code?.uppercased(),
              code.count == 2 else {
            return "🌎"
        }

        let base: UInt32 = 127397
        var flag = ""

        for scalar in code.unicodeScalars {
            if let unicode = UnicodeScalar(base + scalar.value) {
                flag.unicodeScalars.append(unicode)
            }
        }

        return flag
    }

}

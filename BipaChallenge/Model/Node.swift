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
    
    var id : String {
        publicKey
    }
    
}

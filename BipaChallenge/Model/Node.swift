//
//  Node.swift
//  BipaChallenge
//
//  Created by Guilherme Fabbri on 08/01/26.
//

struct Node : Identifiable {
        
    let id: String
    let alias: String
    let channels: Int
    let capacity: Int
    let firstSeen: Int
    let updatedAt: Int
    let city: String?
    let country: String?
    
    
}

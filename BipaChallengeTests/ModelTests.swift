//
//  ViewModelTests.swift
//  BipaChallengeUITests
//
//  Created by Guilherme Fabbri on 11/01/26.
//

import XCTest
@testable import BipaChallenge

final class ModelTests: XCTestCase {
    
    func testNodeModelWithFallback() throws {
        let nodePTBR = Node(
            publicKey: "", alias: "", channels: 0, capacity: 0, firstSeen: Date(), updatedAt: Date(), city: ["pt-BR": "São Paulo"], country: nil, iso_code: nil
        )
        
        XCTAssertEqual(nodePTBR.cityName, "São Paulo")
        
        let nodeUnknown = Node(
            publicKey: "", alias: "", channels: 0, capacity: 0, firstSeen: Date(), updatedAt: Date(), city: nil, country: nil, iso_code: nil
        )
        
        XCTAssertEqual(nodeUnknown.cityName, "Desconhecida")
        
    }
    
    
    func testIsoCountryFlag() throws {
        
        let nodeBR = Node(
            publicKey: "", alias: "", channels: 0, capacity: 0, firstSeen: Date(), updatedAt: Date(), city: nil, country: nil, iso_code: "BR"
        )
        
        XCTAssertEqual(nodeBR.countryFlag, "🇧🇷")
        
        let nodeRandom = Node(
            publicKey: "", alias: "", channels: 0, capacity: 0, firstSeen: Date(), updatedAt: Date(), city: nil, country: nil, iso_code: "ASDSAD"
        )
        
        XCTAssertEqual(nodeRandom.countryFlag, "🌎")
        
        let nodeNil =  Node(
            publicKey: "", alias: "", channels: 0, capacity: 0, firstSeen: Date(), updatedAt: Date(), city: nil, country: nil, iso_code: nil
        )
        
        XCTAssertEqual(nodeNil.countryFlag, "🌎")
        
    }
}

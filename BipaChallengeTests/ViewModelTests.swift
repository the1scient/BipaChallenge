//
//  ViewModelTests.swift
//  BipaChallengeUITests
//
//  Created by Guilherme Fabbri on 11/01/26.
//

import XCTest
@testable import BipaChallenge

final class ViewModelTests: XCTestCase {
    
    var nVM : NodeViewModel!
    var cVM : ChannelViewModel!
    
    
    override func setUpWithError() throws {
        nVM = NodeViewModel()
        cVM = ChannelViewModel()
    }
    
    func testEmptyStates() throws {
        XCTAssertTrue(nVM.nodes.isEmpty)
        XCTAssertTrue(cVM.channelLocation.isEmpty)
        
        XCTAssertFalse(nVM.isLoading)
        XCTAssertFalse(cVM.isLoading)
        
        XCTAssertNil(nVM.errorMsg)
        XCTAssertNil(cVM.errorMsg)
        
    }
    
    func testLoadingState() throws {
        nVM.fetchNodes()
        XCTAssertTrue(nVM.isLoading)
        
        cVM.fetchChannelGeodata(publicKey: "03864ef025fde8fb587d989186ce6a4a186895ee44a926bfc370e2c366597a3f8f")
        XCTAssertTrue(cVM.isLoading)
        
    }
    
    func testDataReturned() throws {
        
        let nodesExpectation = expectation(description: "Successfully fetched Nodes")
        let channelExpectation = expectation(description: "Successfully fetched Channel's Locations")
        
        nVM.fetchNodes()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            XCTAssertFalse(self.nVM.isLoading) // isLoading should already be false
            XCTAssertGreaterThan(self.nVM.nodes.count, 0) // API should return nodes info successfully and they should be transformed into nodes
            
            XCTAssertNil(self.nVM.errorMsg) // no errors should exist
            nodesExpectation.fulfill()
        }
        
        cVM.fetchChannelGeodata(publicKey: "03864ef025fde8fb587d989186ce6a4a186895ee44a926bfc370e2c366597a3f8f")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            XCTAssertFalse(self.cVM.isLoading)
            XCTAssertGreaterThan(self.cVM.channelLocation.count, 0)
            XCTAssertNil(self.cVM.errorMsg)
            channelExpectation.fulfill()
        }
        
        waitForExpectations(timeout: 20)
        
        
    }
    
    
    
}

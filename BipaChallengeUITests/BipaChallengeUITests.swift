//
//  BipaChallengeUITests.swift
//  BipaChallengeUITests
//
//  Created by Guilherme Fabbri on 11/01/26.
//

import XCTest
@testable import BipaChallenge

final class BipaChallengeUITests: XCTestCase {

    var app : XCUIApplication!
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }

    override func tearDownWithError() throws {
        app = nil // Apparently this cleans the testing environment once the tests finish
    }

    @MainActor
    func testNavigationBar() throws {
        XCTAssertTrue(app.navigationBars["Bipa Challenge"].waitForExistence(timeout: 3))
    }
    
    @MainActor
    func testListExistence() throws {
        //  let nodeList = app.tables.firstMatch
        
        // Couldn't check the existence of the list using XCTAssertTrue + waitForExistence on the list 😕
    }
    
    @MainActor
    func testListSize() throws {
        let nodeList = app.collectionViews
        
        XCTAssertGreaterThan(nodeList.cells.count, 0)
        XCTAssertLessThan(nodeList.cells.count, 101)
        
    }
    
    
}

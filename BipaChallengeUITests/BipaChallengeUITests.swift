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
        let nodesList = app.collectionViews["nodesList"]
        
        XCTAssertTrue(nodesList.waitForExistence(timeout: 3))
        
    }
    
    @MainActor
    func testListSize() throws {
        let nodeList = app.collectionViews
        
        XCTAssertGreaterThan(nodeList.cells.count, 0)
        XCTAssertLessThan(nodeList.cells.count, 101)
        
    }
    
    @MainActor
    func testNavigationToDetailsView() throws {
        
        let nodesList = app.collectionViews["nodesList"]
        
        XCTAssertTrue(nodesList.waitForExistence(timeout: 3))
        
        let firstNodeItem = nodesList.cells.firstMatch
        XCTAssertTrue(firstNodeItem.waitForExistence(timeout: 3))
        
        firstNodeItem.tap()
        
        let detailButton = app.buttons["Ver no mapa"]
        XCTAssertTrue(detailButton.waitForExistence(timeout: 5))
        
    }
    
    
    
}

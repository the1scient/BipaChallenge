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
    
    func testTextsExistence() throws {
        
        let nodesList = app.collectionViews["nodesList"]
        
        XCTAssertTrue(nodesList.waitForExistence(timeout: 3))

        let firstCell = nodesList.cells.firstMatch
        XCTAssertTrue(firstCell.waitForExistence(timeout: 3))
        
        let listAlias = firstCell.staticTexts.element(boundBy: 0).label
        print(listAlias)
        
        firstCell.tap()
        
        let detailAlias = app.staticTexts.containing(NSPredicate(format: "label CONTAINS %@", listAlias)).firstMatch
        // First time using NSPredicate and this type of formatting.
        // What this does is essentially:
        // 1 - Get all the static texts in the app containing some stuff
        // 2 - NSPredicate is a filter by condition function
        // 3 - "label" is how we specify the text inside the app
        // 4 - CONTAINS %@ is a placeholder, replaced by what we pass after the comma (in this case is listAlias)
        // This test passed, and it's a cool way to test =)
        
        XCTAssertTrue(detailAlias.waitForExistence(timeout: 5))
        
    }
    
    
    
}

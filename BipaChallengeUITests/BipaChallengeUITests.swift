//
//  BipaChallengeUITests.swift
//  BipaChallengeUITests
//
//  Created by Guilherme Fabbri on 11/01/26.
//

import XCTest
@testable import BipaChallenge

final class BipaChallengeUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }
    
    override func tearDownWithError() throws {
        
    }

    @MainActor
    func testExample() throws {
        let app = XCUIApplication()
        app.launch()

        XCTAssertTrue(app.navigationBars["Bipa Challenge"].waitForExistence(timeout: 3))
        
    }
    
}

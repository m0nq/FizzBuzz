//
//  ViewControllerUITests.swift
//  FizzBuzzUITests
//
//  Created by Monk Wellington on 11/29/18.
//  Copyright © 2018 Industrial Logic. All rights reserved.
//

import XCTest

class ViewControllerUITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testTapNumberButtonIncrementsScore() {
        XCUIApplication().buttons["numberButton"].tap()
        let newScore = XCUIApplication().buttons["numberButton"].label
        XCTAssertEqual(newScore, "1")
    }
    
    func testTapNumberButtonTwiceScoreUpdatesToTwo(){
        let numberButton = XCUIApplication().buttons["numberButton"]
        numberButton.tap()
        numberButton.tap()

        let newScore = numberButton.label
        XCTAssertEqual(newScore, "2")
    }
}

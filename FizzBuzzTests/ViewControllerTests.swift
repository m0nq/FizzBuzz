//
// Created by Monk Wellington on 2018-11-28.
// Copyright (c) 2018 Industrial Logic. All rights reserved.
//

import XCTest
@testable import FizzBuzz

class ViewControllerTests: XCTestCase {

    var viewController: ViewController!

    override func setUp() {
        super.setUp()

        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        viewController = (storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController)
        UIApplication.shared.keyWindow!.rootViewController = viewController

        let _ = viewController.view
        viewController.gameCounter = 1
    }

    override func tearDown() {
        super.tearDown()
        viewController.game?.score = 1
        viewController.gameScore.text = "1"
    }

    func testMove1IncrementsScore() {
        viewController.play(move: "1")
        let newScore = viewController.gameScore.text
        XCTAssertEqual(newScore, "1")
    }
    
    func testMove2IncrementScore() {
        viewController.game?.score = 2
        viewController.play(move: "2")
        let newScore = viewController.gameScore.text
        XCTAssertEqual(newScore, "2")
    }
    
    func testPlayerDoesntScores() {
        viewController.game?.score = 1
        viewController.play(move: "3")
        XCTAssertEqual(viewController.gameScore.text, "1")
    }
    
    func testPlayerDoesScore() {
        viewController.gameCounter = 3
        viewController.game?.score = 2
        viewController.play(move: "Fizz")
        XCTAssertEqual(viewController.gameScore.text, "3")
    }
}

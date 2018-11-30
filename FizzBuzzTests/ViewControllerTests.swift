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
    }

    override func tearDown() {
        super.tearDown()
    }

    func testMove1IncrementsScore() {
        viewController.play(move: "1")
        let newScore = viewController.game?.score
        XCTAssertEqual(newScore, 1)
    }
    
    func testMove2IncrementScore() {
        viewController.play(move: "1")
        viewController.play(move: "2")
        let newScore = viewController.game?.score
        XCTAssertEqual(newScore, 2)
    }
    
    func testHasAGame() {
        XCTAssertNotNil(viewController.game)
    }
    
    func testPlayerDoesntScores() {
        viewController.game?.score = 1
        viewController.play(move: "3")
        XCTAssertEqual(viewController.game?.score, 1)
    }
    
    func testPlayerDoesScore() {
        viewController.game?.score = 2
        viewController.play(move: "Fizz")
        XCTAssertEqual(viewController.game?.score, 3)
    }
}

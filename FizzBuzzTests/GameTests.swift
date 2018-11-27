//
//  GameTests.swift
//  FizzBuzzTests
//
//  Created by Monk Wellington on 11/26/18.
//  Copyright © 2018 Industrial Logic. All rights reserved.
//

import XCTest
@testable import FizzBuzz

class GameTests: XCTestCase {

    let game = Game()
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        game.score = 0
    }

    func testGameStartsAtZero() {
        XCTAssertTrue(game.score == 0)
    }
    
    func testPlayScoreIncremented() {
        game.score = 1
        _ = game.play(move: "1")
        XCTAssertTrue(game.score == 1)
    }
    
    func testOnPlayScoreIncrementedTwice() {
        _ = game.play(move: "1")
        _ = game.play(move: "2")
        XCTAssertTrue(game.score == 2)
    }
    
    func testIfMoveIsRight() {
        game.score = 2
        let result = game.play(move: "Fizz")
        XCTAssertEqual(result, true)
    }
    
    func testOnPlayFizzWhenScoreIsOneReturnsFalse() {
        XCTAssertFalse(game.play(move: "Fizz"))
    }
    
    func testOnPlayBuzzWhenScoreIsFourReturnsTrue() {
        game.score = 4
        XCTAssertTrue(game.play(move: "Buzz"))
    }
    
    func testOnPlayBuzzWhenScoreIsThreeReturnsFalse() {
        game.score = 3
        XCTAssertFalse(game.play(move: "Buzz"))
    }
    
    func testOnPlayFizzBuzzWhenScoreIsFourteenReturnsTrue() {
        game.score = 14
        XCTAssertTrue(game.play(move: "FizzBuzz"))
    }
    
    func testOnPlayFizzBuzzWhenScoreIsThirteenReturnsFalse() {
        game.score = 13
        XCTAssertFalse(game.play(move: "FizzBuzz"))
    }
    
    func testOnPlayNumberIsReturnedIsTrue() {
        game.score = 1
        XCTAssertTrue(game.play(move: "2"))
    }
    
    func testScoreIsNotIncrementedOnWrongMove() {
        game.score = 1
        _ = game.play(move: "Fizz")
        XCTAssertEqual(game.score, 1)
    }
}

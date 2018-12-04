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

    func testPlayerScoreIncremented() {
        _ = game.play(move: "1", counter: 1)
        XCTAssertTrue(game.score == 1)
    }

    func testOnPlayScoreIncrementedTwice() {
        _ = game.play(move: "1", counter: 1)
        _ = game.play(move: "2", counter: 2)
        XCTAssertTrue(game.score == 2)
    }

    func testIfMoveIsRight() {
        game.score = 2
        let result = game.play(move: "Fizz", counter: 3)
        XCTAssertEqual(result.right, true)
    }

    func testOnPlayFizzWhenScoreIsOneReturnsFalse() {
        XCTAssertFalse(game.play(move: "Fizz", counter: 0).right)
    }

    func testOnPlayBuzzWhenScoreIsFourReturnsTrue() {
        game.score = 4
        XCTAssertTrue(game.play(move: "Buzz", counter: 5).right)
    }

    func testOnPlayBuzzWhenScoreIsThreeReturnsFalse() {
        game.score = 3
        XCTAssertFalse(game.play(move: "Buzz", counter: game.score).right)
    }

    func testOnPlayFizzBuzzWhenScoreIsFourteenReturnsTrue() {
        game.score = 14
        XCTAssertTrue(game.play(move: "FizzBuzz", counter: 15).right)
    }

    func testOnPlayFizzBuzzWhenScoreIsThirteenReturnsFalse() {
        game.score = 13
        XCTAssertFalse(game.play(move: "FizzBuzz", counter: game.score).right)
    }

    func testScoreIsNotIncrementedOnWrongMove() {
        game.score = 1
        _ = game.play(move: "Fizz", counter: game.score)
        XCTAssertEqual(game.score, 1)
    }

    func testPlayShouldReturnIfMoveRight() {
        let response = game.play(move: "1", counter: 0)
        XCTAssertNotNil(response.right)
    }

    func testPlayShouldReturnNewScore() {
        let response = game.play(move: "1", counter: 0)
        XCTAssertNotNil(response.score)
    }
}

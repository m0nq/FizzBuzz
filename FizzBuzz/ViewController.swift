//
//  ViewController.swift
//  FizzBuzz
//
//  Created by Monk Wellington on 11/26/18.
//  Copyright © 2018 Industrial Logic. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var game: Game?

    var gameCounter: Int? {
        didSet {
            numberButton.setTitle("\(self.gameCounter ?? 1)", for: .normal)
        }
    }

    @IBOutlet weak var numberButton: UIButton!
    @IBOutlet weak var gameScore: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        guard let unwrappedGame = self.game else {
            print("Game is not initialized yet. So...")
            game = Game()
            guard let unwrappedGameScore = game?.score else {
                gameScore.text = "0"
                return
            }
            gameScore.text = "\(unwrappedGameScore)"
            return
        }
        gameScore.text = "\(unwrappedGame.score)"
    }


    func play(move: String) {
        guard let unwrappedGame = game else {
            print("Game is nil!")
            return
        }
        self.gameScore.text = "\(unwrappedGame.play(move: move, counter: self.gameCounter ?? 1).score)"
        self.gameCounter = (self.gameCounter ?? 1) + 1
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        guard self.gameCounter != nil else {
            print("Game score is nil")
            self.gameCounter = 1
            playMove(sender: sender)
            return
        }
        playMove(sender: sender)
    }

    private func playMove(sender: UIButton) {
        switch sender.accessibilityIdentifier! {
        case "numberButton":
            play(move: "\(self.gameCounter ?? 1)")
        case "fizzButton":
            play(move: "Fizz")
        case "buzzButton":
            play(move: "Buzz")
        case "fizzBuzzButton":
            play(move: "FizzBuzz")
        default:
            print("You pushed a button that doesn't exist. How did you do that? O.o")
        }
    }
    
    @IBAction func playAgain(_ sender: Any) {
        self.gameScore.text = "0"
        game?.score = 0
        self.gameCounter = 1
    }
}



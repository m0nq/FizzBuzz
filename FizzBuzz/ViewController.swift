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
    
    var gameScore: Int? {
        didSet {
            guard let unwrappedScore = self.gameScore else {
                print("gameScore is not initialized.")
                return
            }
            numberButton.setTitle("\(unwrappedScore)", for: .normal)
        }
    }
    
    @IBOutlet weak var numberButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let unwrappedGame = self.game else {
            print("Game is not initialized yet. So...")
            game = Game()
            guard let unwrappedGameScore = game?.score else {
                self.gameScore = 0
                return
            }
            self.gameScore = unwrappedGameScore
            return
        }
        print("The game is initialized, ya heard!")
        self.gameScore = unwrappedGame.score
    }


    func play(move: String) {
        guard let unwrappedGame = game else {
            print("Game is nil!")
            return
        }
        self.gameScore = unwrappedGame.play(move: move).score
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        guard let unwrappedScore = self.gameScore else {
            print("Game score is nil")
            return
        }
        
        let nextScore = unwrappedScore + 1
        play(move: "\(nextScore)")
    }
}


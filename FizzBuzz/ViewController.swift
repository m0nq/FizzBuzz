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
            numberButton.setTitle("\(self.gameCounter ?? 0)", for: .normal)
        }
    }
    
    @IBOutlet weak var numberButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let unwrappedGame = self.game else {
            print("Game is not initialized yet. So...")
            game = Game()
            guard let unwrappedGameScore = game?.score else {
                self.gameCounter = 0
                return
            }
            self.gameCounter = unwrappedGameScore
            return
        }
        print("The game is initialized, ya heard!")
        self.gameCounter = unwrappedGame.score
    }


    func play(move: String) {
        guard let unwrappedGame = game else {
            print("Game is nil!")
            return
        }
        _ = unwrappedGame.play(move: move)
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        guard let unwrappedCounter = self.gameCounter else {
            print("Game score is nil")
            return
        }
        
        self.gameCounter = unwrappedCounter + 1
        play(move: "\(self.gameCounter ?? 0)")
    }
}



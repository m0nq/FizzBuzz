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
    
    var gameScore: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        game = Game()
    }


    func play(move: String) {
        guard let unwrappedGame = game else {
            print("Game is nil!")
            return
        }
        self.gameScore = unwrappedGame.play(move: move).score
    }
}


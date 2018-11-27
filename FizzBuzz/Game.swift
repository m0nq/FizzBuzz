//
//  Game.swift
//  FizzBuzz
//
//  Created by Monk Wellington on 11/26/18.
//  Copyright © 2018 Industrial Logic. All rights reserved.
//

import Foundation

class Game {
    
    var score = 0
    let brain = Brain()
    
    func play(move: String) -> Bool {
        let result = brain.check(number: self.score + 1)
        if result == move {
            self.score += 1
            return true
        }
        return false
    }
}

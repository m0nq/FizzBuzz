//
// Created by Monk Wellington on 2018-12-06.
// Copyright (c) 2018 Industrial Logic. All rights reserved.
//

import Foundation

enum Move: Equatable {
    case number(Int), fizz, buzz, fizzBuzz
}

func ==(lhs: Move, rhs: Move) -> Bool {
    switch (lhs, rhs) {
    case (.number(let a), .number(let b)):
        return a == b
    case (.fizz, .fizz):
        return true
    case (.buzz, .buzz):
        return true
    case (.fizzBuzz, .fizzBuzz):
        return true
    default:
        return false
    }
}
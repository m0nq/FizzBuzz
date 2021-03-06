//
//  Brain.swift
//  FizzBuzz
//
//  Created by Monk Wellington on 11/26/18.
//  Copyright © 2018 Industrial Logic. All rights reserved.
//

import Foundation

class Brain {

    func isDivisibleByThree(number: Int) -> Bool {
        return isDivisibleBy(number: number, divisor: 3)
    }

    func isDivisibleByFive(number: Int) -> Bool {
        return isDivisibleBy(number: number, divisor: 5)
    }

    func isDivisibleByThreeAndFive(number: Int) -> Bool {
        return isDivisibleByThree(number: number) && isDivisibleByFive(number: number)
    }

    private func isDivisibleBy(number: Int, divisor: Int) -> Bool {
        return number % divisor == 0
    }

    func check(number: Int) -> Move {
        if isDivisibleByThreeAndFive(number: number) {
            return .fizzBuzz
        } else if isDivisibleByThree(number: number) {
            return .fizz
        } else if isDivisibleByFive(number: number) {
            return .buzz
        }
        return .number(number)
    }
}

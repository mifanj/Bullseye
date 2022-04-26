//
//  Game.swift
//  Bullseye
//
//  Created by Jack on 2022/3/28.
//

import Foundation

struct Game {
    var target: Int = Int.random(in: 1...100)
    var score: Int = 0
    var round: Int = 1
    
    func points(sliderValue: Int) -> Int {
        let diff = abs(target - sliderValue)
        var bonus = 0
        if diff == 0 {
            bonus = 100
        } else if diff <= 2 {
            bonus = 50
        }
        return 100 - diff + bonus
    }
    
    mutating func startNewRound(points: Int) {
        score += points
        round += 1
        target = Int.random(in: 1...100)
    }
    
    mutating func restart() {
        score = 0
        round = 1
        target = Int.random(in: 1...100)
    }
}

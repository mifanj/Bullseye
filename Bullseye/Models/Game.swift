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
        return 100 - abs(target - sliderValue)
    }
}

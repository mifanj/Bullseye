//
//  BullseyeTests.swift
//  BullseyeTests
//
//  Created by Jack on 2022/3/30.
//

import XCTest
@testable import Bullseye

class BullseyeTests: XCTestCase {

    var game: Game!
    
    override func setUpWithError() throws {
        game = Game()
    }

    override func tearDownWithError() throws {
        game = nil
    }

    func testScorePositive() throws {
        let guess = game.target + 5
        let score = game.points(sliderValue: guess)
        XCTAssertEqual(score, 95)
    }
    
    func testScoreNegative() throws {
        let guess = game.target - 5
        let score = game.points(sliderValue: guess)
        XCTAssertEqual(score, 95)
    }

}

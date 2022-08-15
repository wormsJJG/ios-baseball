//
//  main.swift
//  ios-baseball
//
//  Created by 정재근 on 2022/08/09.
//

import Foundation

var remainingCount: Int = 9

func generateRandomNumber() -> Set<Int> {
    
    var randomIntArray: Set<Int> = []
    
    while randomIntArray.count < 3{
        randomIntArray.insert(Int.random(in: 1...9))
    }
    return randomIntArray
}

func startGame() {
    
    while(remainingCount >= 1) {
        
        let userNumber = generateRandomNumber()
        let computerNumber = generateRandomNumber()
        
        print("임의의 수 : \(Array(userNumber)[0]) \(Array(userNumber)[0]) \(Array(userNumber)[0])")

        dicisionWinLose(userNumber, computerNumber)
    }
}

func dicisionWinLose(_ human: Set<Int>, _ computer: Set<Int>){
    
    remainingCount -= 1
    
    var strikeCount: Int = 0
    var ballCount: Int = 0
    
    for i in 0...2 {
        
        if Array(human)[i] == Array(computer)[i] {
            strikeCount += 1
        } else if computer.contains(Array(computer)[i]) {
            ballCount += 1
        }
    }
    
    if strikeCount == 3 {
        print("\(strikeCount) 스트라이크, \(ballCount) 볼")
        print("사용자 승리!")
        remainingCount = 9
    } else if remainingCount == 0 {
        print("컴퓨터 승리")
        print("\(strikeCount) 스트라이크, \(ballCount) 볼")
        print("남은 기회: \(remainingCount)")
    } else {
        print("\(strikeCount) 스트라이크, \(ballCount) 볼")
        print("남은 기회: \(remainingCount)")
        startGame()
    }
    
}

startGame()

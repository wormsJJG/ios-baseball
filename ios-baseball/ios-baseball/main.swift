//
//  main.swift
//  ios-baseball
//
//  Created by 정재근 on 2022/08/09.
//

import Foundation

var remainingCount: Int = 9
var userSelectMenuNumber: Int = 0

func menu() {
    print("1. 게임시작")
    print("2. 게임종료")
    print("원하는 기능을 선택해주세요 :", terminator: " ")
    
    let inputMenuNumber = readLine()
    
    if let value = inputMenuNumber {
        userSelectMenuNumber = Int(value) ?? -1
    } else {
        print("입력이 잘못되었습니다.")
        menu()
    }
    
    menuNumberCheck(userSelectMenuNumber)
}

func menuNumberCheck(_ menuNumber: Int) {
    
    if menuNumber == 1 {
        startGame()
    } else if menuNumber == 2 {
        print("게임종료")
    } else {
        print("입력이 잘못되었습니다.")
        menu()
    }
}

func generateRandomNumber() -> Set<Int> {
    
    var randomIntArray: Set<Int> = []
    
    while randomIntArray.count < 3{
        
        randomIntArray.insert(Int.random(in: 1...9))
    }
    return randomIntArray
}

func startGame() {
    while(remainingCount>=1) {
        print("숫자 3개를 띄어쓰기로 구분하여 입력해주세요.")
        print("중복 숫자는 허용하지 않습니다.")
        print("입력:", terminator: " ")
        var userNumberSet: Set<Int> = []
        let userNumber = readLine() ?? ""
        let computerNumber = generateRandomNumber()
        if userNumber.count < 5 {
            print("입력이 잘못되었습니다.")
            startGame()
        }
        
        let userNumberArrary = userNumber.split(separator: " ")
        for num in userNumberArrary {
            let intVal = Int(num) ?? -1
            if userNumberSet.contains(intVal) {
                print("입력이 잘못되었습니다.")
                startGame()
            } else if userNumberSet.contains(-1) {
                print("입력이 잘못되었습니다.")
                startGame()
            } else {
                userNumberSet.insert(Int(num) ?? -1)
            }
        }
        userNumberSet.reversed()
        winLoseDicision(userNumberSet, computerNumber)
    }
}

func winLoseDicision(_ human: Set<Int>,_ computer: Set<Int>){
    
    remainingCount -= 1
    
    var strikeCount: Int = 0
    var ballCount: Int = 0
    
    for i in 0...2 {
        if Array(human)[i] == Array(computer)[i] {
            strikeCount += 1
        } else if computer.contains(Array(human)[i]) {
            ballCount += 1
        }
    }
    
    if strikeCount == 3 {
        print("\(strikeCount) 스트라이크, \(ballCount) 볼")
        print("사용자 승리!")
        menu()
        remainingCount = 9
    } else if remainingCount == 0 {
        print("컴퓨터 승리")
        print("\(strikeCount) 스트라이크, \(ballCount) 볼")
        print("남은 기회: \(remainingCount)")
        remainingCount = 9
    } else {
        print("\(strikeCount) 스트라이크, \(ballCount) 볼")
        print("남은 기회: \(remainingCount)")
        startGame()
    }
    
}

menu()

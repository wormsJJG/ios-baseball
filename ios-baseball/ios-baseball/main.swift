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
        remainingCount = 9
        gameStart()
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
//        let number = Int.random(in: 1...9)
//        if !randomIntArray.contains(number) {
//            randomIntArray.append(number)
//        }
    }
    return randomIntArray
}

func gameStart() {
    while(remainingCount>=1) {
//        print("숫자 3개를 띄어쓰기로 구분하여 입력해주세요.")
//        print("중복 숫자는 허용하지 않습니다.")
        let randomNumber = generateRandomNumber()
        let inputNumber = generateRandomNumber()
//        print("입력:", terminator: " ")
        print("임의의 수 :", terminator: " ")
        for number in inputNumber {
            print(number, terminator: " ")
        }
        print("")
        winLoseDicision(inputNumber, randomNumber)
//        if inputValue.count < 5 {
//            print("입력이 잘못되었습니다.")
//            gameStart()
//        }
        
//        let inputValArr = inputValue.split(separator: " ")
//        for num in inputValArr {
//            let intVal = Int(num) ?? -1
//            if inputIntArr.contains(intVal) {
//                print("입력이 잘못되었습니다.")
//                gameStart()
//            } else if inputIntArr.contains(-1) {
//                print("입력이 잘못되었습니다.")
//                gameStart()
//            } else {
//                inputIntArr.append(Int(num) ?? -1)
//            }
//        }
        
    }
    
//    startMenu()
}

func winLoseDicision(_ human: Set<Int>,_ computer: Set<Int>){
    
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
//        menu()
        remainingCount = 9
    } else if remainingCount == 0 {
        print("컴퓨터 승리")
        print("\(strikeCount) 스트라이크, \(ballCount) 볼")
        print("남은 기회: \(remainingCount)")
    } else {
        print("\(strikeCount) 스트라이크, \(ballCount) 볼")
        print("남은 기회: \(remainingCount)")
        gameStart()
    }
    
}
//startMenu()
gameStart()

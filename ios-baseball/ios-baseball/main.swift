//
//  main.swift
//  ios-baseball
//
//  Created by 정재근 on 2022/08/09.
//

import Foundation

var menuNum: Int = 0
var leftCnt: Int = 9

func startMenu() {
    print("1. 게임시작")
    print("2. 게임종료")
    print("원하는 기능을 선택해주세요 :", terminator: " ")
    menuNum = Int(readLine()!)!
    menuNumCheck(menuNum)
}

func menuNumCheck(_ menuNum: Int) {
    
    if(menuNum == 1) {
        gameStart()
    } else if(menuNum == 2) {
        print("게임종료")
    } else {
        print("입력이 잘못되었습니다.")
        
        startMenu()
    }
}
func createRandomIntArray() -> [Int] {
    var randomIntArray: [Int] = []
    for _ in 0...2{
        randomIntArray.append(Int.random(in: 1...9))
    }
    return randomIntArray
}
func gameStart() {
    var inputIntArr: [Int] = []
    let randomIntArray = createRandomIntArray()
    print("임의의 수 :", terminator: " ")
    let inputValue: String = readLine()!
    var inputValArr = inputValue.split(separator: " ")
    for num in inputValArr {
        inputIntArr.append(Int(num) ?? 0)
    }
}
func winOrLoseCheck(_ human: [Int],_ computer: [Int]) {
    
}
startMenu()

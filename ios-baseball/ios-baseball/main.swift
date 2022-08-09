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
    
    if menuNum == 1 {
        gameStart()
    } else if menuNum == 2 {
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
    let inputValArr = inputValue.split(separator: " ")
    for num in inputValArr {
        inputIntArr.append(Int(num) ?? 0)
    }
    let result: Dictionary<String, Int> = winOrLoseCheck(inputIntArr, randomIntArray)
    print("\(result["s"]!) 스트라이크, \(result["b"]!) 볼")
}
func winOrLoseCheck(_ human: [Int],_ computer: [Int]) -> Dictionary<String, Int> {
    var s_count: Int = 0
    var b_count: Int = 0
    for i in 0...2{
        if human[i] == computer[i] {
            s_count += 1
        } else if computer.contains(human[i]) {
            b_count += 1
        }
    }
    let dic: Dictionary<String, Int> = ["s": s_count, "b": b_count]
    
    return dic
}

startMenu()

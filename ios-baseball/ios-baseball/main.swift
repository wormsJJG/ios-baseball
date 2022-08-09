//
//  main.swift
//  ios-baseball
//
//  Created by 정재근 on 2022/08/09.
//

import Foundation

var menuNum: Int = 0
var leftCnt: Int = 9
var winOrLose: Int = 0

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
    while randomIntArray.count < 3{
        let number = Int.random(in: 1...9)
        if !randomIntArray.contains(number){
            randomIntArray.append(number)
        }
    }
    return randomIntArray
}
func gameStart() {
    while(leftCnt>=1 && winOrLose == 0){
    print("숫자 3개를 띄어쓰기로 구분하여 입력해주세요.")
    print("중복 숫자는 허용하지 않습니다.")
    var inputIntArr: [Int] = []
    let randomIntArray = createRandomIntArray()
        
        for r in randomIntArray {
            print(r)
        }
        
    print("입력 :", terminator: " ")
    let inputValue: String = readLine()!
        
        if inputValue.count < 5 {
            print("입력이 잘못되었습니다.")
            gameStart()
        }
        
    let inputValArr = inputValue.split(separator: " ")
    for num in inputValArr {
        let intVal = Int(num) ?? -1
        if inputIntArr.contains(intVal){
            print("입력이 잘못되었습니다.")
            gameStart()
        }else if inputIntArr.contains(-1){
            print("입력이 잘못되었습니다.")
            gameStart()
        } else{
            inputIntArr.append(Int(num) ?? -1)
        }
    }
    let result: Dictionary<String, Int> = winOrLoseCheck(inputIntArr, randomIntArray)
    print("\(result["s"]!) 스트라이크, \(result["b"]!) 볼")
    if winOrLose == -1 {
        print("사용자 승리!")
    } else if leftCnt == 0{
        print("컴퓨터 승리!")
    } else{
        print("남은 기회 : \(leftCnt)")
    }
    }
    leftCnt = 9
    startMenu()
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
    if s_count == 3 {
        winOrLose = -1
        leftCnt = -1
    }
    leftCnt -= 1
    let dic: Dictionary<String, Int> = ["s": s_count, "b": b_count]
    
    return dic
}

startMenu()

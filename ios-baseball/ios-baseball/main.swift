//
//  main.swift
//  ios-baseball
//
//  Created by 정재근 on 2022/08/09.
//

import Foundation

var menuNum: Int = 0

func startMenu() {
        print("1. 게임시작")
        print("2. 게임종료")
        print("원하는 기능을 선택해주세요 :", terminator: " ")
        menuNum = Int(readLine()!)!
        menuNumCheck(menuNum)
}

func menuNumCheck(_ menuNum: Int) {
    if(menuNum == 1) {
        print("게임시작")
    } else if(menuNum == 2) {
        print("게임시작")
    } else {
        print("입력이 잘못되었습니다.")
        startMenu()
    }
}

startMenu()

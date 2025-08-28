//
//  WordQuizViewModel.swift
//  gguro
//
//  Created by 이채은 on 7/14/25.
//
import Foundation
import SwiftUI

class WordQuizViewModel {
    
    let wordQuizSample: [WordQuizModel] = [
        .init(fullQuestion: "여름에 가면 시원한 파도가 치는 곳! 🌊", correctAnswer: "바다", hint: ["ㅂ", "ㄷ"], highlightPart: "시원한 파도",childAnswer: "부도", isCorrect: false),
        .init(fullQuestion: "밤하늘에 반짝이는 건?✨", correctAnswer: "별빛", hint: ["ㅂ", "ㅂ"], highlightPart: "반짝이는 건", childAnswer: "부도",isCorrect: true),
        .init(fullQuestion: "마시면 키가 크도록 도와주는 음료는? 🥛", correctAnswer: "우유", hint: ["ㅇ", "ㅇ"], highlightPart: "키가 크도록", childAnswer: "부도", isCorrect: true),
        .init(fullQuestion: "책가방 안에 넣는 필기구는?✏️", correctAnswer: "연필", hint: ["ㅇ", "ㅍ"], highlightPart: "필기구", childAnswer: "부도", isCorrect: true),
        .init(fullQuestion: "달콤한 빨간 과일은?🍓", correctAnswer: "딸기", hint: ["ㄸ", "ㄱ"], highlightPart: "빨간 과일", childAnswer: "부도", isCorrect: true)
    ]
}

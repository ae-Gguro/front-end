//
//  WordQuizModel.swift
//  gguro
//
//  Created by 이채은 on 7/14/25.
//
import Foundation

struct WordQuizModel: Identifiable {
    let id = UUID()
    let fullQuestion: String
    let correctAnswer: String
    let hint: [String]
    let highlightPart: String
    var childAnswer: String
    var isCorrect: Bool = false
}

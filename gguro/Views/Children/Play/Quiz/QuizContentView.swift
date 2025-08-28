//
//  QuizContentView.swift
//  gguro
//
//  Created by 이채은 on 7/15/25.
//

import SwiftUI

struct QuizContentView: View {
    let state: WordQuizState
    
    var body: some View {
        switch state {
        case .intro:
            QuizIntroView()
        case .listening:
            ListeningView()
        case .thinking:
            ThinkingView()
        case .correctAnswer:
            QuizCorrectAnswerView()
        case .wrongAnswer:
            QuizWrongAnswerView()
        case .revealAnswer:
            QuizRevealAnswerView()
        case .ended:
            QuizEndedView()
        }
    }
}

struct WordQuizScreen: View {
    @Environment(\.childNameAYA) private var childName
    
    var body: some View {
        BlackBoardLayout(type: .wordQuiz(name: childName)) {
            QuizContentView(state: .intro)
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    WordQuizScreen()
}

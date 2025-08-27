//
//  ChildrenAIType.swift
//  gguro
//
//  Created by 이채은 on 7/14/25.
//

import SwiftUI
import Foundation

enum ChildrenAIType {
    case aiChat(name: String)
    case rolePlay(name: String)
    case wordQuiz(name: String)
    case lifeStudy(name: String)
    case animalStudy(name: String)
    
    var messageBox: MessageBox {
        switch self {
        case.aiChat(let name):
            return MessageBox(content: Text("\(name)! 오늘은 어떤일들이 있었어? 👀"))
        case .rolePlay(let name):
            return MessageBox(content: Text("\(name)! 우리 역할 놀이 하자! 😎"))
        case .wordQuiz(let name):
            return MessageBox(content: Text("\(name)! 같이 단어를 맞혀 보자! 🧐"))
        case .lifeStudy(let name):
            return MessageBox(content: Text("\(name)! 어떤 바른 생활을 살아볼까? 🎒 "))
        case .animalStudy(let name):
            return MessageBox(content: Text("\(name)! 어떤 동물이 궁금해? 🐾"))
        }
    }
    
}

enum AIChatState {
    case intro
    case listening
    case thinking
    case ended
}

enum WordQuizState {
    case intro
    case listening
    case thinking
    case correctAnswer
    case wrongAnswer
    case revealAnswer
    case ended
}

enum RoleplayState {
    case intro(name: String)
    case listening
    case thinking
    case confirm(name: String)
    case started
    case ended
}

enum LifeStudyState {
    case intro(name: String)
    case question(name: String)
    case correctAnswer(name: String)
    case wrongAnswer(name: String)
    case listening
    case thinking
}

enum AnimalStudyState {
    case intro(name: String)
    case question(name: String)
    case correctAnswer(name: String)
    case wrongAnswer(name: String)
    case listening
    case thinking
}

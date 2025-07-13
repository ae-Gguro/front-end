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
            return MessageBox(content: Text("\(name)야(아)! 오늘은 어떤일들이 있었어? 👀"))
        case.rolePlay(let name):
            return MessageBox(content: Text("\(name)야(아)! 우리 역할 놀이 하자! 😎"))
        case.wordQuiz(let name):
            return MessageBox(content: Text("\(name)야(아)! 같이 단어를 맞혀 보자! 🧐"))
        case.lifeStudy(let name):
            return MessageBox(content: Text("\(name)야(아)! 어떤 바른 생활을 살아볼까? 🎒 "))
        case.animalStudy(let name):
            return MessageBox(content: Text("\(name)야(아)! 어떤 동물이 궁금해? 🐾"))
        }
    }
    
}

enum AIChatState {
    case intro
    case listening
    case thinking
    case ended
}

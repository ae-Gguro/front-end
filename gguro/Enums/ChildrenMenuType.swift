//
//  ChildrenMenuType.swift
//  gguro
//
//  Created by 이채은 on 7/13/25.
//

import SwiftUI
import Foundation

enum ChildrenMenuType {
    case conversation
    case playing
    case studying
    case quiz
    case roleplay
    case lifeStudy
    case animalStudy
    
    var title: Text {
        switch self {
        case .conversation:
            return Text("꾸로랑 재미있는\n") + Text("이야기").foregroundStyle(.red1) + Text("하자!")
        case .playing:
            return Text("꾸로랑 같이\n") + Text("놀러").foregroundStyle(.red1) + Text(" 가자!")
        case .studying:
            return Text("꾸로랑 열심히\n") + Text("공부").foregroundStyle(.red1) + Text("하자!")
        case .quiz:
            return Text("초성").foregroundStyle(.red1) + Text("을\n맞혀볼까?")
        case .roleplay:
            return Text("꾸로와 함께하는\n") + Text("역할 놀이").foregroundStyle(.red1) + Text("!")
        case .lifeStudy:
            return Text("꾸로와 함께하는\n") + Text("바른 생활").foregroundStyle(.red1) + Text("!")
        case .animalStudy:
            return Text("꾸로와 함께하는\n") + Text("동물 공부").foregroundStyle(.red1) + Text("!")
        }
        
    }
    
    var icon: Image {
        switch self {
        case .conversation:
            return Image(.iconChat)
        case .playing:
            return Image(.iconBlock)
        case .studying:
            return Image(.iconStudy)
        case .quiz:
            return Image(.iconKorean)
        case .roleplay:
            return Image(.iconMedical)
        case .lifeStudy:
            return Image(.iconClock)
        case .animalStudy:
            return Image(.iconCat)
        }
    }
    
    var buttonTitle: String {
        switch self {
        case .conversation:
            return "이야기 나눠요"
        case .playing:
            return "신나게 놀아요"
        case .studying:
            return "공부 시작해요"
        case .quiz:
            return "단어 맞혀요"
        case .roleplay:
            return "역할 놀이해요"
        case .lifeStudy:
            return "바른 생활해요"
        case .animalStudy:
            return "동물 알아봐요"
        }
    }
}

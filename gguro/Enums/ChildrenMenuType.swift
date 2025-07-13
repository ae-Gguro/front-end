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
    
    var title: Text {
        switch self {
        case .conversation:
            return Text("꾸로랑 재미있는\n") + Text("이야기").foregroundStyle(.red1) + Text("하자!")
        case .playing:
            return Text("꾸로랑 같이\n") + Text("놀러").foregroundStyle(.red1) + Text(" 가자!")
        case .studying:
            return Text("꾸로랑 열심히\n") + Text("공부").foregroundStyle(.red1) + Text("하자!")
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
        }
    }
}

//
//  ParentsMenuType.swift
//  gguro
//
//  Created by 김미주 on 7/12/25.
//

import Foundation
import SwiftUI

enum ParentsMenuType {
    case conversation(name: String)
    case emotion(name: String)
    
    var title: Text {
        switch self {
        case .conversation(let name):
            return Text("\(name)의 ") + Text("대화").foregroundStyle(.blue1) + Text(" 데이터")
        case .emotion(let name):
            return Text("\(name)의 ") + Text("감정").foregroundStyle(.blue1) + Text(" 변화")
        }
    }
    
    var icon: Image {
        switch self {
        case .conversation:
            return Image(.iconData)
        case .emotion:
            return Image(.iconChart)
        }
    }
    
    var buttonTitle: String {
        switch self {
        case .conversation:
            return "대화 데이터 확인하기"
        case .emotion:
            return "감정 변화 확인하기"
        }
    }
}

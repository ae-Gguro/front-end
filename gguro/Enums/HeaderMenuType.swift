//
//  HeaderMenu.swift
//  gguro
//
//  Created by 김미주 on 7/13/25.
//

import Foundation
import SwiftUI

enum HeaderMenuType {
    case children
    case parents
    case home
    case mypage
    
    var icon: Image {
        switch self {
        case .children:
            return Image(.iconProfileRed)
        case .parents:
            return Image(.iconProfileBlue)
        case .home:
            return Image(.iconHouse)
        case .mypage:
            return Image(.iconHeart)
        }
    }
    
    var title: String {
        switch self {
        case .children:
            return "아이용"
        case .parents:
            return "어른용"
        case .home:
            return "홈"
        case .mypage:
            return "마이페이지"
        }
    }
}

//
//  ProfileColor.swift
//  gguro
//
//  Created by 김미주 on 7/13/25.
//

import Foundation
import SwiftUI

enum ProfileColor {
    case red
    case yellow
    case green
    case blue
    case purple
    
    var main: Color {
        switch self {
        case .red:
            return .red1
        case .yellow:
            return .yellow1
        case .green:
            return .green1
        case .blue:
            return .blue1
        case .purple:
            return .purple1
        }
    }
    
    var sub: Color {
        switch self {
        case .red:
            return .red2
        case .yellow:
            return .yellow2
        case .green:
            return .green2
        case .blue:
            return .blue2
        case .purple:
            return .purple2
        }
    }
}

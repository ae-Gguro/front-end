//
//  ProfileCreateType.swift
//  gguro
//
//  Created by 김미주 on 7/15/25.
//

import Foundation

enum ProfileCreateType {
    case onboarding
    case parents
    
    var color: String {
        switch self {
        case .onboarding:
            return "red"
        case .parents:
            return "blue"
        }
    }
}

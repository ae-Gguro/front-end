//
//  ProfileRoute.swift
//  gguro
//
//  Created by 김미주 on 8/23/25.
//

import Foundation

enum ProfileRoute: Hashable {
    case profileSelect
    case profileCreate(type: ProfileCreateType)
}

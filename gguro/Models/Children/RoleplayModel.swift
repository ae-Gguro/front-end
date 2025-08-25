//
//  RoleplayModel.swift
//  gguro
//
//  Created by 이채은 on 7/15/25.
//

import Foundation

struct RoleplayModel: Identifiable {
    var id = UUID()
    var userRole: String
    var botRole: String
}

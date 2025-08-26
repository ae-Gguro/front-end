//
//  ChildProfileResponse.swift
//  gguro
//
//  Created by 김미주 on 8/27/25.
//

import Foundation

struct ChildProfileResponse: Decodable {
    let isSuccess: Bool
    let code: String
    let message: String
    let result: ChildProfileResult
}

struct ChildProfileResult: Decodable {
    let profileId: Int
    let profileName: String
    let profileBirthDate: String
    let profileImageUrl: String
}

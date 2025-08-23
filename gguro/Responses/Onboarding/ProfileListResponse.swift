//
//  ProfileListResponse.swift
//  gguro
//
//  Created by 김미주 on 8/8/25.
//

import Foundation

struct ProfileListResponse: Decodable {
    let isSuccess: Bool
    let code: String
    let message: String
    let result: ProfileListResult
}

struct ProfileListResult: Decodable {
    let profiles: [ProfileListProfile]
}

struct ProfileListProfile: Decodable {
    let profileId: Int
    let profileName: String
    let profileBirthDate: String
    let profileImageUrl: String
}

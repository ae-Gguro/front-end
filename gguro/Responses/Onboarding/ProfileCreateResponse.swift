//
//  ProfileCreateResponse.swift
//  gguro
//
//  Created by 김미주 on 8/8/25.
//

import Foundation

struct ProfileCreateResponse: Decodable {
    let isSuccess: Bool
    let code: String
    let message: String
    let result: ProfileCreateResult
}

struct ProfileCreateResult: Decodable {
    let createdAt: String
    let updatedAt: String
    let id: Int
    let name: String
    let birth: String
    let imageUrl: String
    let user: ProfileCreateUser
}

struct ProfileCreateUser: Decodable {
    let createdAt: String
    let updatedAt: String
    let id: Int
    let username: String?
    let password: String?
    let nickname: String
    let isSocialLogin: Bool
    let email: String?
    let oauthId: String?
    let oauthType: String?
    let profileList: [String]?
}

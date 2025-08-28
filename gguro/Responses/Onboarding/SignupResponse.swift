//
//  SignupResponse.swift
//  gguro
//
//  Created by 김미주 on 8/25/25.
//

import Foundation

struct SignupResponse: Decodable {
    let isSuccess: Bool
    let code: String
    let message: String
    let result: SignupResult
}

struct SignupResult: Codable {
    let createdAt: String
    let updatedAt: String
    let id: Int
    let username: String
    let password: String
    let nickname: String
    let isSocialLogin: Bool
    let email: String?
    let oauthId: Int?
    let oauthType: String
    let devides: String?
}

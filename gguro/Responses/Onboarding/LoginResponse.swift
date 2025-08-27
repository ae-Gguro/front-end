//
//  LoginResponse.swift
//  gguro
//
//  Created by 김미주 on 8/24/25.
//

import Foundation

struct LoginResponse: Decodable {
    let isSuccess: Bool
    let code: String
    let message: String
    let result: LoginResult
}

struct LoginResult: Decodable {
    let accessToken: String
    let refreshToken: String
    let grantType: String
    let expiresIn: Int
}

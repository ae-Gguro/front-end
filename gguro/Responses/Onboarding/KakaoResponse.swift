//
//  KakaoResponse.swift
//  gguro
//
//  Created by 김미주 on 7/27/25.
//

import Foundation

struct SocialLoginResponse: Decodable {
    let isSuccess: Bool
    let code: String
    let message: String
    let result: SocialLoginResult
}

struct SocialLoginResult: Codable {
    let accessToken: String
    let refreshToken: String
    let grantType: String
    let expiresIn: Int
}

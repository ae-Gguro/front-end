//
//  BaseTarget.swift
//  gguro
//
//  Created by 김미주 on 7/22/25.
//

import Foundation
import Moya

enum OnboardingRouter {
    case postSignup(signupData: SignupData)
    case postLogin(loginData: LoginData)
    case postNaver(accessToken: String)
    case postKakao(accessToken: String)
//    case postApple
}

extension OnboardingRouter: APITargetType {
    private static let authPath = "/api/auth"
    
    // path
    var path: String {
        switch self {
        case .postSignup:
            return "\(Self.authPath)/signup"
        case .postLogin:
            return "\(Self.authPath)/login"
        case .postNaver:
            return "\(Self.authPath)/naver"
        case .postKakao:
            return "\(Self.authPath)/kakao"
        }
    }
    
    // method
    var method: Moya.Method {
        return .post
    }
    
    // task
    var task: Task {
        switch self {
        case .postSignup(let signupData):
            return .requestJSONEncodable(signupData)
        case .postLogin(let loginData):
            return .requestJSONEncodable(loginData)
        case .postNaver(let accessToken), .postKakao(let accessToken):
            return .requestJSONEncodable(["accessToken": accessToken])
        }
    }
}

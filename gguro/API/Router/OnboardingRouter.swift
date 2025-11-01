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
    case postLogout(deviceToken: String)
    case deleteUser
}

extension OnboardingRouter: APITargetType {
    // url
    var baseURL: URL {
        return URL(string: Config.baseURL)!
    }
    
    // path
    private static let authPath = "/api/auth"
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
        case .postLogout:
            return "\(Self.authPath)/logout"
        case .deleteUser:
            return "\(Self.authPath)/delete"
        }
    }
    
    // method
    var method: Moya.Method {
        switch self {
        case .deleteUser:
            return .delete
        default:
            return .post
        }
    }
    
    // task
    var task: Task {
        switch self {
        case .postSignup(let signupData):
            return .requestJSONEncodable(signupData)
        case .postLogin(let loginData):
            return .requestJSONEncodable(loginData)
        case .postNaver(let accessToken), .postKakao(let accessToken):
            return .requestParameters(parameters: ["accessToken": accessToken], encoding: JSONEncoding.default)
        case .postLogout(let deviceToken):
            return .requestParameters(parameters: ["deviceToken": deviceToken], encoding: JSONEncoding.default)
        case .deleteUser:
            return .requestPlain
        }
    }
}

//
//  AppleRouter.swift
//  gguro
//
//  Created by 김미주 on 8/27/25.
//

import Foundation
import Moya

enum AppleRouter {
    case postApple(code: String)
}

extension AppleRouter: APITargetType {
    // url
    var baseURL: URL {
        return URL(string: Config.baseURL)!
    }
    
    // path
    private static let authPath = "/api/auth"
    var path: String {
        switch self {
        case .postApple:
            return "\(Self.authPath)/apple"
        }
    }
    
    // method
    var method: Moya.Method {
        return .post
    }
    
    // task
    var task: Task {
        switch self {
        case .postApple(let code):
          return .requestParameters(
            parameters: ["code": code],
            encoding: URLEncoding.default
          )
        }
    }
    
    var headers: [String : String]? {
        ["Content-Type": "application/x-www-form-urlencoded"]
    }
}

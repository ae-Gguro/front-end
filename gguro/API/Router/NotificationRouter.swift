//
//  NotificationRouter.swift
//  gguro
//
//  Created by 김미주 on 8/24/25.
//

import Foundation
import Moya

// 알림 API
enum NotificationRouter {
    // 디바이스 토큰
    case postDeviceToken(token: String)
}

extension NotificationRouter: APITargetType {
    // url
    var baseURL: URL {
        return URL(string: Config.baseURL)!
    }
    
    var path: String {
        switch self {
        case .postDeviceToken:
            return "/api/device-token"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .postDeviceToken:
                .post
        }
    }
    
    var task: Task {
        switch self {
        case .postDeviceToken(let token):
            return .requestParameters(
                parameters: ["token": token, "deviceType": "iOS"],
                encoding: JSONEncoding.default
            )
        }
    }
}

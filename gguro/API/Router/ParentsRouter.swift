//
//  ParentsRouter.swift
//  gguro
//
//  Created by 김미주 on 8/26/25.
//

import Foundation
import Moya

enum ParentsRouter {
    // history
    case getChatrooms(profileId: Int) // 프로필별 채팅방 목록 조회
    case getTalks(chatroomId: Int) // 채팅방별 대화 내용 조회
    case patchFeedback(talkId: Int) // 대화 피드백(좋아요/싫어요) 남기기
}

extension ParentsRouter: APITargetType {
    // url
    var baseURL: URL {
        return URL(string: Config.AIbaseURL)!
    }
    
    // path
    var path: String {
        switch self {
        case .getChatrooms(let profileId):
            return "/api/history/chatrooms/\(profileId)"
        case .getTalks(let chatroomId):
            return "/api/history/talks/\(chatroomId)"
        case .patchFeedback(let talkId):
            return "/api/history/talks/\(talkId)/feedback"
        }
    }
    
    // method
    var method: Moya.Method {
        switch self {
        case .getChatrooms, .getTalks:
            return .get
        case .patchFeedback:
            return .patch
        }
    }
    
    // task
    var task: Task {
        switch self {
        case .getChatrooms:
            return .requestPlain
        case .getTalks:
            return .requestPlain
        case .patchFeedback:
            return .requestPlain
        }
    }
}

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
    
    // analysis
    case getSummaryDaily(profileId: Int) // 오늘 하루 긍정/부정 단어 요약
    case getSummaryWeekly(profileId: Int) // 지난주 긍정/부정 종합 리포트
    case getSummaryMonthly(profileId: Int, year: Int, month: Int) // 월간 긍정/부정 상태 리포트
    case getSummary(profileId: Int) // 전체 기간 날짜별 분석 목록 조회
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
            
        case .getSummaryDaily(let profileId):
            return "/api/analysis/summary/daily/\(profileId)"
        case .getSummaryWeekly(let profileId):
            return "/api/analysis/summary/weekly/\(profileId)"
        case .getSummaryMonthly(let profileId, _, _):
            return "/api/analysis/summary/monthly/\(profileId)"
        case .getSummary(let profileId):
            return "/api/analysis/sentiment-summary/\(profileId)"
        }
    }
    
    // method
    var method: Moya.Method {
        switch self {
        case .getChatrooms, .getTalks, .getSummaryDaily, .getSummaryWeekly, .getSummaryMonthly, .getSummary:
            return .get
        case .patchFeedback:
            return .patch
        }
    }
    
    // task
    var task: Task {
        switch self {
        case .getChatrooms, .getTalks, .patchFeedback:
            return .requestPlain
            
        case .getSummaryDaily, .getSummaryWeekly, .getSummary:
            return .requestPlain
        case .getSummaryMonthly(_, let year, let month):
            return .requestParameters(parameters: ["year": year, "month": month], encoding: URLEncoding.queryString)
        }
    }
}

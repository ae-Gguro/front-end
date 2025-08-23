//
//  MypageButtonType.swift
//  gguro
//
//  Created by 김미주 on 8/23/25.
//

import Foundation

enum MypageButtonType {
    case reportToday
    case reportWeek
    case conversation
    case setting
    
    var title: String {
        switch self {
        case .reportToday:
            "오늘의 감정 분석 리포트 보러 가기"
        case .reportWeek:
            "지난 주 감정 분석 리포트 보러 가기"
        case .conversation:
            "대화 기록 보러 가기"
        case .setting:
            "알림 및 계정 설정"
        }
    }
}

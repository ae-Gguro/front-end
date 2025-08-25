//
//  NotificationType.swift
//  gguro
//
//  Created by 김미주 on 8/24/25.
//

import Foundation

enum NotificationType {
    case all
    case service
    case today
    case week
    
    var title: String {
        switch self {
        case .all:
            "전체 알림"
        case .service:
            "서비스 알림"
        case .today:
            "오늘의 리포트"
        case .week:
            "지난 주 리포트"
        }
    }
    
    var guideText: String {
        switch self {
        case .all:
            ""
        case .service:
            "아이의 대화 기록이 없을 시, 13시/18시에 알림이 전송됩니다."
        case .today:
            "매일 밤 22시에 알림이 전송됩니다."
        case .week:
            "매주 월요일 아침 10시에 알림이 전송됩니다."
        }
    }
}

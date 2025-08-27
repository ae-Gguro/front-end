//
//  MonthReportResponse.swift
//  gguro
//
//  Created by 김미주 on 8/27/25.
//

import Foundation

struct MonthReportResponse: Decodable {
    let profile_id: Int
    let year: Int
    let month: Int
    let monthly_positive_percentage: Int
    let daily_statuses: [DailyStatus]
}

struct DailyStatus: Decodable {
    let day: Int
    let status: String
}

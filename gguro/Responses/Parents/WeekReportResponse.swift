//
//  WeekReportResponse.swift
//  gguro
//
//  Created by 김미주 on 8/27/25.
//

import Foundation

struct WeekReportResponse: Decodable {
    let profile_id: Int
    let start_date: String
    let end_date: String
    let top_positive_keywords: [TopKeywordResponse]
    let top_negative_keywords: [TopKeywordResponse]
    let daily_summary: [WeekSummaryResponse]
}

struct TopKeywordResponse: Decodable {
    let keyword: String
    let count: Int
}

struct WeekSummaryResponse: Decodable {
    let date: String
    let day: String
    let positive_percentage: Int
    let negative_percentage: Int
}

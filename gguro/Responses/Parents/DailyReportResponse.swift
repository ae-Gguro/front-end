//
//  DailyReportResponse.swift
//  gguro
//
//  Created by 김미주 on 8/27/25.
//

import Foundation

struct DailyReportResponse: Decodable {
    let profile_id: Int
    let date: String
    let positive_percentage: Int
    let negative_percentage: Int
    let positive_keywords: [String]
    let negative_keywords: [String]
}

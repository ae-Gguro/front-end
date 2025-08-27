//
//  SentimentSummaryResponse.swift
//  gguro
//
//  Created by 김미주 on 8/27/25.
//

import Foundation

typealias SentimentSummaryResponse = [String: [SentimentItem]]

struct SentimentItem: Decodable, Identifiable {
    var id: Int { talkId }
    let talkId: Int
    let chatroomId: Int
    let text: String
    let keyword: String?
    let positive: Bool
}

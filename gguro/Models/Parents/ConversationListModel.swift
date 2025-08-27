//
//  ConversationListModel.swift
//  gguro
//
//  Created by 김미주 on 7/14/25.
//

import Foundation

struct ConversationList: Hashable, Decodable {
    let id: Int
    let topic: String
    let createdAt: String
    
    // 응답용
    enum CodingKeys: String, CodingKey {
        case id, topic
        case createdAt = "created_at"
    }
}

struct PaginationConversationData {
    let page: Int
    let isLast: Bool // 마지막 페이지의 데이터인지
    let conversations: [ConversationList]
}

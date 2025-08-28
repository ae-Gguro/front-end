//
//  ConversationDetailModel.swift
//  gguro
//
//  Created by 김미주 on 7/14/25.
//

import Foundation

struct ConversationDetailModel: Hashable, Decodable {
    let id: Int
    let role: String
    let content: String
    let createdAt: String
    
    // 응답용
    enum CodingKeys: String, CodingKey {
        case id, role, content
        case createdAt = "created_at"
    }
}

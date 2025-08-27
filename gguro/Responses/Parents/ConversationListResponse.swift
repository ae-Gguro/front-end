//
//  ConversationListResponse.swift
//  gguro
//
//  Created by 김미주 on 8/26/25.
//

import Foundation

struct ConversationListResponse: Decodable {
    let isSuccess: Bool
    let code: String
    let message: String
    let result: ConversationListResult
}

struct ConversationListResult: Decodable {
    let id: Int
    let token: String
    let deviceType: String
    let createdAt: String
    let active: Bool
}

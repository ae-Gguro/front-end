//
//  ConversationListModel.swift
//  gguro
//
//  Created by 김미주 on 7/14/25.
//

import Foundation

struct ConversationList: Hashable {
    let id: Int
    let topic: String
    let date: String
}

struct PaginationConversationData {
    let page: Int
    let isLast: Bool // 마지막 페이지의 데이터인지
    let conversations: [ConversationList]
}

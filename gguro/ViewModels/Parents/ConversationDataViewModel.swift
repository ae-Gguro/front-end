//
//  ConversationDataViewModel.swift
//  gguro
//
//  Created by 김미주 on 7/14/25.
//

import Foundation

@Observable
class ConversationDataViewModel {
    // 샘플 데이터
    let conversationSample: [ConversationList] = [
        .init(id: 0, topic: "대화 주제 1", date: "2025-07-06T18:46:50.120126"),
        .init(id: 1, topic: "대화 주제 2", date: "2025-07-06T18:46:50.120126"),
        .init(id: 2, topic: "대화 주제 3", date: "2025-07-06T18:46:50.120126"),
        .init(id: 3, topic: "대화 주제 4", date: "2025-07-06T18:46:50.120126"),
        .init(id: 4, topic: "대화 주제 5", date: "2025-07-06T18:46:50.120126"),
        .init(id: 5, topic: "대화 주제 6", date: "2025-07-06T18:46:50.120126"),
        .init(id: 6, topic: "대화 주제 7", date: "2025-07-06T18:46:50.120126"),
        .init(id: 7, topic: "대화 주제 8", date: "2025-07-06T18:46:50.120126"),
        .init(id: 8, topic: "대화 주제 9", date: "2025-07-06T18:46:50.120126"),
        .init(id: 9, topic: "대화 주제 10", date: "2025-07-06T18:46:50.120126"),
        .init(id: 10, topic: "대화 주제 11", date: "2025-07-06T18:46:50.120126"),
        .init(id: 11, topic: "대화 주제 12", date: "2025-07-06T18:46:50.120126"),
        .init(id: 12, topic: "대화 주제 13", date: "2025-07-06T18:46:50.120126"),
        .init(id: 13, topic: "대화 주제 14", date: "2025-07-06T18:46:50.120126"),
        .init(id: 14, topic: "대화 주제 15", date: "2025-07-06T18:46:50.120126"),
        .init(id: 15, topic: "대화 주제 16", date: "2025-07-06T18:46:50.120126"),
        .init(id: 16, topic: "대화 주제 17", date: "2025-07-06T18:46:50.120126"),
        .init(id: 17, topic: "대화 주제 18", date: "2025-07-06T18:46:50.120126"),
        .init(id: 18, topic: "대화 주제 19", date: "2025-07-06T18:46:50.120126"),
        .init(id: 19, topic: "대화 주제 20", date: "2025-07-06T18:46:50.120126"),
        .init(id: 20, topic: "대화 주제 21", date: "2025-07-06T18:46:50.120126"),
        .init(id: 21, topic: "대화 주제 22", date: "2025-07-06T18:46:50.120126"),
        .init(id: 22, topic: "대화 주제 23", date: "2025-07-06T18:46:50.120126"),
        .init(id: 23, topic: "대화 주제 24", date: "2025-07-06T18:46:50.120126"),
        .init(id: 24, topic: "대화 주제 25", date: "2025-07-06T18:46:50.120126"),
    ]
    
    // 페이지 당 리스트 수
    private let itemsPerPage = 6
    
    // 현재 페이지
    var currentPage: Int = 1
    
    // 총 페이지 수 계산
    var totalPage: Int {
        let count = conversationSample.count
        return Int(ceil(Double(count) / Double(itemsPerPage)))
    }
    
    // 현재 페이지의 리스트 반환
    var currentPageItems: [ConversationList] {
        let start = (currentPage - 1) * itemsPerPage
        let end = min(start + itemsPerPage, conversationSample.count)
        return Array(conversationSample[start..<end])
    }
    
    // 페이지 이동
    func goToPage(_ page: Int) {
        guard page >= 1 && page <= totalPage else { return }
        currentPage = page
    }
}

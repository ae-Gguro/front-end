//
//  ConversationDataViewModel.swift
//  gguro
//
//  Created by 김미주 on 7/14/25.
//

import Foundation

class ConversationDataViewModel: ObservableObject {
    let provider = APIManager.shared.createProvider(for: ParentsRouter.self)
    
    @Published var chatroomList: [ConversationList] = []
    
    // 페이지 당 리스트 수
    private let itemsPerPage = 6
    
    // 현재 페이지
    var currentPage: Int = 1
    
    // 총 페이지 수 계산
    var totalPage: Int {
        let count = chatroomList.count
        return Int(ceil(Double(count) / Double(itemsPerPage)))
    }
    
    // 현재 페이지의 리스트 반환
    var currentPageItems: [ConversationList] {
        let start = (currentPage - 1) * itemsPerPage
        let end = min(start + itemsPerPage, chatroomList.count)
        return Array(chatroomList[start..<end])
    }
    
    // 페이지 이동
    func goToPage(_ page: Int) {
        guard page >= 1 && page <= totalPage else { return }
        currentPage = page
    }
    
    // MARK: - Function
    func fetchGetChatrooms() {
        let savedProfileId = UserDefaults.standard.object(forKey: "profileId") as? Int
        guard let profileId = savedProfileId else {
            print("선택된 프로필이 없습니다.")
            return
        }
        provider.request(.getChatrooms(profileId: profileId)) { result in
            switch result {
            case .success(let response):
                do {
                    let decodedData = try JSONDecoder().decode([ConversationList].self, from: response.data)
                    
                    DispatchQueue.main.async {
                        self.chatroomList = decodedData
                    }
                } catch {
                    print("GetChatrooms 디코더 오류: \(error)")
                }
            case .failure(let error):
                print("GetChatrooms API 오류: \(error)")
            }
        }
    }
}

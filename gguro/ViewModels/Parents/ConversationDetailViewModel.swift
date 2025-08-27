//
//  ConversationDetailViewModel.swift
//  gguro
//
//  Created by 김미주 on 7/14/25.
//

import Foundation

class ConversationDetailViewModel: ObservableObject {
    let provider = APIManager.shared.createProvider(for: ParentsRouter.self)
    
    @Published var conversationList: [ConversationDetailModel] = []
    
    func fetchGetTalks() {
        let savedChatroomId = UserDefaults.standard.object(forKey: "chatroomId") as? Int
        guard let chatroomId = savedChatroomId else {
            print("선택된 대화방이 없습니다.")
            return
        }
        provider.request(.getTalks(chatroomId: chatroomId)) { result in
            switch result {
            case .success(let response):
                do {
                    let decodedData = try JSONDecoder().decode([ConversationDetailModel].self, from: response.data)
                    
                    DispatchQueue.main.async {
                        self.conversationList = decodedData
                    }
                } catch {
                    print("GetTalks 디코더 오류: \(error)")
                }
            case .failure(let error):
                print("GetTalks API 오류: \(error)")
            }
        }
    }
}

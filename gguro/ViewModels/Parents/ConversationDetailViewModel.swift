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
    
    func fetchGetTalks(chatroomId: Int) {
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

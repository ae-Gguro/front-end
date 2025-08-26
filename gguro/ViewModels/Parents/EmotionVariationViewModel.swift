//
//  EmotionVariationViewModel.swift
//  gguro
//
//  Created by 김미주 on 7/14/25.
//

import Foundation

class EmotionVariationViewModel: ObservableObject {
    let provider = APIManager.shared.createProvider(for: ParentsRouter.self)
    
    @Published var variationList: [String: [SentimentItem]] = [:]
    
    struct DayGroup: Identifiable {
        let id: String
        let dateString: String
        let items: [SentimentItem]
    }
    
    var groups: [DayGroup] {
        variationList
            .map { DayGroup(id: $0.key, dateString: $0.key, items: $0.value) }
            .sorted { $0.dateString > $1.dateString }
    }
    
    func fetchSentimentSummary() {
        let savedProfileId = UserDefaults.standard.object(forKey: "profileId") as? Int
        guard let profileId = savedProfileId else {
            print("선택된 프로필이 없습니다.")
            return
        }
        provider.request(.getSummary(profileId: profileId)) { result in
            switch result {
            case .success(let response):
                do {
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    let byDate = try decoder.decode(SentimentSummaryResponse.self, from: response.data)
                    
                    self.variationList = byDate
                } catch {
                    print("GetSummary 디코더 오류: \(error)")
                }
            case .failure(let error):
                print("GetSummary API 오류: \(error)")
            }
        }
    }
}

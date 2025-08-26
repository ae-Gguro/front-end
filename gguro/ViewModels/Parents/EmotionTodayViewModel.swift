//
//  EmotionTodayViewModel.swift
//  gguro
//
//  Created by 김미주 on 8/27/25.
//

import Foundation

class EmotionTodayViewModel: ObservableObject {
    let provider = APIManager.shared.createProvider(for: ParentsRouter.self)
    
    @Published var dailyReport: DailyReportResponse?
    
    func fetchDailyReport() {
        let savedProfileId = UserDefaults.standard.object(forKey: "profileId") as? Int
        guard let profileId = savedProfileId else {
            print("선택된 프로필이 없습니다.")
            return
        }
        provider.request(.getSummaryDaily(profileId: profileId)) { result in
            switch result {
            case .success(let response):
                do {
                    let decodedData = try JSONDecoder().decode(DailyReportResponse.self, from: response.data)
                    self.dailyReport = decodedData
                } catch {
                    print("GetSummaryDaily 디코더 오류: \(error)")
                }
            case .failure(let error):
                print("GetSummaryDaily API 오류: \(error)")
            }
        }
    }
}

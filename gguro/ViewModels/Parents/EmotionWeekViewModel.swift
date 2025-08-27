//
//  EmotionWeekViewModel.swift
//  gguro
//
//  Created by 김미주 on 8/27/25.
//

import Foundation

class EmotionWeekViewModel: ObservableObject {
    let provider = APIManager.shared.createProvider(for: ParentsRouter.self)
    
    @Published var advice: String = ""
    @Published var topPositiveKeywords: [TopKeywordResponse] = []
    @Published var topNegativeKeywords: [TopKeywordResponse] = []
    @Published var weekReport: [WeekSummaryResponse] = []
    
    func fetchAdvice() {
        let savedProfileId = UserDefaults.standard.object(forKey: "profileId") as? Int
        guard let profileId = savedProfileId else {
            print("선택된 프로필이 없습니다.")
            return
        }
        provider.request(.postAdvice(profileId: profileId)) { result in
            switch result {
            case .success(let response):
                do {
                    let decodedData = try JSONDecoder().decode(AdviceResponse.self, from: response.data)
                    self.advice = decodedData.advice
                } catch {
                    print("PostAdvice 디코더 오류: \(error)")
                }
            case .failure(let error):
                print("PostAdvice API 오류: \(error)")
            }
        }
    }
    
    func fetchWeekReport() {
        let savedProfileId = UserDefaults.standard.object(forKey: "profileId") as? Int
        guard let profileId = savedProfileId else {
            print("선택된 프로필이 없습니다.")
            return
        }
        provider.request(.getSummaryWeekly(profileId: profileId)) { result in
            switch result {
            case .success(let response):
                do {
                    let decodedData = try JSONDecoder().decode(WeekReportResponse.self, from: response.data)
                    self.topPositiveKeywords = decodedData.top_positive_keywords
                    self.topNegativeKeywords = decodedData.top_negative_keywords
                    self.weekReport = decodedData.daily_summary
                } catch {
                    print("GetSummaryWeekly 디코더 오류: \(error)")
                }
            case .failure(let error):
                print("GetSummaryWeekly API 오류: \(error)")
            }
        }
    }
}

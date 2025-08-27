//
//  ParentsViewModel.swift
//  gguro
//
//  Created by 김미주 on 8/27/25.
//

import Foundation

class ParentsViewModel: ObservableObject {
    let provider = APIManager.shared.createProvider(for: ProfileRouter.self)
    
    @Published var name: String = "아이"
    
    func fetchChildName() {
        let savedProfileId = UserDefaults.standard.object(forKey: "profileId") as? Int
        guard let profileId = savedProfileId else {
            print("선택된 프로필이 없습니다.")
            return
        }
        provider.request(.getFirstname(profileId: profileId)) { result in
            switch result {
            case .success(let response):
                do {
                    let decodedData = try JSONDecoder().decode(BasicResponse.self, from: response.data)
                    
                    self.name = decodedData.result
                } catch {
                    print("GetFirstname 디코더 오류: \(error)")
                }
            case .failure(let error):
                print("GetFirstname API 오류: \(error)")
            }
        }
    }
}

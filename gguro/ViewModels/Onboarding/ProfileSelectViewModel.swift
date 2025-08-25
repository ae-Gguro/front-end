//
//  ProfileSelectViewModel.swift
//  gguro
//
//  Created by 김미주 on 8/8/25.
//

import Foundation

class ProfileSelectViewModel: ObservableObject {
    @Published var profileList: [ProfileListProfile] = []
    
    // 프로필 선택 여부
    @Published var isSelected: Bool = false
    
    // 선택된 프로필 id
    @Published var selectedProfileId: Int?
    
    let provider = APIManager.shared.createProvider(for: ProfileRouter.self)

    func fetchProfileList() {
        provider.request(.getProfiles) { result in
            switch result {
            case .success(let response):
                do {
                    let decodedData = try JSONDecoder().decode(ProfileListResponse.self, from: response.data)
                    let result = decodedData.result
                    
                    self.profileList = result.profiles
                } catch {
                    print("GetProfiles 디코더 오류: \(error)")
                }
            case .failure(let error):
                print("GetProfiles API 오류: \(error)")
            }
        }
    }
    
    func selectProfile(_ profile: ProfileListProfile) {
        selectedProfileId = profile.profileId
        isSelected = true
    }
}

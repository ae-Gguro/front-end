//
//  MypageViewModel.swift
//  gguro
//
//  Created by 김미주 on 8/27/25.
//

import Foundation

class MypageViewModel: ObservableObject {
    let profileProvider = APIManager.shared.createProvider(for: ProfileRouter.self)
    let onboardingProvider = APIManager.shared.createProvider(for: OnboardingRouter.self)
    
    @Published var name: String = "아이"
    @Published var birth: String = "0000.00.00"
    @Published var image: String = ""
    
    let savedProfileId = UserDefaults.standard.object(forKey: "profileId") as? Int
    
    func fetchProfile() {
        guard let profileId = savedProfileId else {
            print("선택된 프로필이 없습니다.")
            return
        }
        
        profileProvider.request(.getProfileDetail(profileId: profileId)) { result in
            switch result {
            case .success(let response):
                do {
                    let decodedDate = try JSONDecoder().decode(ChildProfileResponse.self, from: response.data)
                    let result = decodedDate.result
                    
                    self.name = result.profileName
                    self.birth = result.profileBirthDate
                    self.image = result.profileImageUrl
                } catch {
                    print("GetProfileDetail 디코더 오류: \(error)")
                }
            case .failure(let error):
                print("GetProfileDetail API 오류: \(error)")
            }
        }
    }
    
    // 프로필 삭제
    func deleteProfile(completion: @escaping () -> Void) {
        guard let profileId = savedProfileId else {
            print("선택된 프로필이 없습니다.")
            return
        }
        
        profileProvider.request(.deleteProfile(profileId: profileId)) { result in
            switch result {
            case .success(let response):
                do {
                    _ = try JSONDecoder().decode(BasicResponse.self, from: response.data)
                    
                    DispatchQueue.main.async {
                        completion()
                    }
                } catch {
                    print("DeleteProfile 디코더 오류: \(error)")
                }
            case .failure(let error):
                print("DeleteProfile API 오류: \(error)")
            }
        }
    }
    
    // 로그아웃
    func logout(completion: @escaping () -> Void) {
        UserDefaults.standard.removeObject(forKey: "profileId")
        guard let token = KeychainManager.standard.loadString(for: "FCMToken") else {
            print("토큰이 없습니다.")
            return
        }
        
        onboardingProvider.request(.postLogout(deviceToken: token)) { result in
            switch result {
            case .success(let response):
                do {
                    _ = try JSONDecoder().decode(BasicResponse.self, from: response.data)
                    
                    DispatchQueue.main.async {
                        completion()
                    }
                } catch {
                    print("Logout 디코더 오류: \(error)")
                }
            case .failure(let error):
                print("Logout API 오류: \(error)")
            }
        }
    }
}

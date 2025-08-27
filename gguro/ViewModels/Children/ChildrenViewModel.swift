//
//  ChildrenViewModel.swift
//  gguro
//
//  Created by 김미주 on 8/27/25.
//

import Foundation

class ChildrenViewModel: ObservableObject {
    let provider = APIManager.shared.createProvider(for: ProfileRouter.self)
    
    @Published var ayaName: String = ""
    @Published var igaName: String = ""
    
    func fetchChildNamePossessive() {
        let savedProfileId = UserDefaults.standard.object(forKey: "profileId") as? Int
        guard let profileId = savedProfileId else {
            print("선택된 프로필이 없습니다.")
            return
        }
        provider.request(.getFirstnamePossessive(profileId: profileId)) { result in
            switch result {
            case .success(let response):
                do {
                    let decodedData = try JSONDecoder().decode(BasicResponse.self, from: response.data)
                    
                    self.ayaName = decodedData.result
                } catch {
                    print("GetFirstnamePossessive 디코더 오류: \(error)")
                }
            case .failure(let error):
                print("GetFirstnamePossessive API 오류: \(error)")
            }
        }
    }
    
    func fetchChildNameNominative() {
        let savedProfileId = UserDefaults.standard.object(forKey: "profileId") as? Int
        guard let profileId = savedProfileId else {
            print("선택된 프로필이 없습니다.")
            return
        }
        provider.request(.getFirstnameNominative(profileId: profileId)) { result in
            switch result {
            case .success(let response):
                do {
                    let decodedData = try JSONDecoder().decode(BasicResponse.self, from: response.data)
                    
                    self.igaName = decodedData.result
                } catch {
                    print("GetFirstnameNominative 디코더 오류: \(error)")
                }
            case .failure(let error):
                print("GetFirstnameNominative API 오류: \(error)")
            }
        }
    }
}

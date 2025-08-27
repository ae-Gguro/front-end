//
//  ProfileCreateViewModel.swift
//  gguro
//
//  Created by 김미주 on 7/27/25.
//

import Foundation
import SwiftUI

class ProfileCreateViewModel: ObservableObject {
    let provider = APIManager.shared.createProvider(for: ProfileRouter.self)
    
    func convertImageToBase64(_ image: UIImage?) -> String? {
        guard let imageData = image?.jpegData(compressionQuality: 0.8) else { return nil }
        return imageData.base64EncodedString()
    }
    
    func fetchCreateProfile(
        firstName: String,
        lastName: String,
        year: Int,
        month: Int,
        day: Int,
        image: String?,
        completion: (() -> Void)? = nil
    ) {
        let profileData = ProfileCreateData(firstName: firstName, lastName: lastName, year: year, month: month, day: day, image: image)
        
        provider.request(.postProfileCreate(profileData: profileData)) { result in
            switch result {
            case .success(let response):
                do {
                    _ = try JSONDecoder().decode(ProfileCreateResponse.self, from: response.data)
                    completion?()
                } catch {
                    print("PostProfileCreate 디코더 오류: \(error)")
                }
            case .failure(let error):
                print("PostProfileCreate API 에러: \(error)")
            }
        }
    }
}

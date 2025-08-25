//
//  SignupViewModel.swift
//  gguro
//
//  Created by 김미주 on 8/25/25.
//

import Foundation

class SignupViewModel: ObservableObject {
    @Published var isSuccess: Bool = false
    
    let provider = APIManager.shared.createProvider(for: OnboardingRouter.self)
    
    func fetchSignup(
        id: String,
        name: String,
        password: String,
        checkPassword: String
    ) {
        let signupData = SignupData(username: id, password: password, nickname: name, checkPassword: checkPassword)
        
        provider.request(.postSignup(signupData: signupData)) { result in
            switch result {
            case .success(let response):
                do {
                    _ = try JSONDecoder().decode(SignupResponse.self, from: response.data)
                    self.isSuccess = true
                } catch {
                    print("PostSignup 디코더 오류: \(error)")
                }
            case .failure(let error):
                print("PostSignup API 에러: \(error)")
            }
        }
    }
}

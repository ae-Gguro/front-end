//
//  LoginViewModel.swift
//  gguro
//
//  Created by 김미주 on 7/22/25.
//

import Foundation
import Moya

@Observable
class KakakoLoginViewModel {
    let provider: MoyaProvider<OnboardingRouter>
    
    init() {
        let logger = NetworkLoggerPlugin(configuration: .init(logOptions: [.verbose]))
        self.provider = MoyaProvider<OnboardingRouter>(plugins: [logger])
    }
    
    // 카카오 로그인
    func postKakaoLogin(_ accessToken: String) {
        provider.request(.postKakao(accessToken: accessToken)) { result in
            switch result {
            case .success(let response):
                print("Kakao Login 성공: \(response.statusCode)")
            case .failure(let error):
                print("Kakao Login 실패: \(error)")
            }
        }
    }
}

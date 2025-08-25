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
    let provider = APIManager.shared.createProvider(for: OnboardingRouter.self)
    
    // 카카오 로그인
    func postKakaoLogin(accessToken: String, completion: @escaping (Bool) -> Void) {
        provider.request(.postKakao(accessToken: accessToken)) { result in
            switch result {
            case .success(let response):
                do {
                    let decodedData = try JSONDecoder().decode(KakaoResponse.self, from: response.data)
                    
                    let userInfo = UserInfo(
                        accessToken: decodedData.result.accessToken,
                        refreshToken: decodedData.result.refreshToken
                    )
                    
                    // 토큰 KeyChain에 저장
                    let saved = KeychainManager.standard.saveSession(userInfo, for: "appNameUser")
                    if saved {
                        print("Token 저장 성공: \(String(describing: userInfo.accessToken))")
                        completion(true)
                    } else {
                        print("Token 저장 실패")
                        completion(false)
                    }
                } catch {
                    print("KakaoResponse 디코더 오류: \(error)")
                    completion(false)
                }
            case .failure(let error):
                print("Kakao Login Error: \(error)")
                completion(false)
            }
        }
    }
}

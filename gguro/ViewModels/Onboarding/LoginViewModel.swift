//
//  LoginViewModel.swift
//  gguro
//
//  Created by 김미주 on 8/24/25.
//

import Foundation
import SwiftUI
import Moya
import AuthenticationServices
import KakaoSDKCommon
import KakaoSDKAuth
import KakaoSDKUser
import NidThirdPartyLogin

// 애플 로그인 User
private struct AppleUserPayload: Encodable {
    struct Name: Encodable {
        let firstName: String?
        let lastName: String?
    }
    let name: Name?
    let email: String?
}

class LoginViewModel: NSObject, ObservableObject {
    private let fcmProvider = APIManager.shared.createProvider(for: NotificationRouter.self)
    private let provider = APIManager.shared.createProvider(for: OnboardingRouter.self)
    private let appleProvider = APIManager.shared.createProvider(for: AppleRouter.self)
    
    @Published var isLogin: Bool = false
    
    // 애플 로그인
    var isLoggedIn: Bool = false
    var userIdentifier: String = ""
    var email: String = ""
    var fullName: String = ""
    var errorMessage: String?
    
    // MARK: - API
    func fetchFcmToken() {
        if let fcm = KeychainManager.standard.loadString(for: "FCMToken") {
            fcmProvider.request(.postDeviceToken(token: fcm)) { result in
                switch result {
                case .success(let response):
                    do {
                        _ = try JSONDecoder().decode(DeviceTokenResponse.self, from: response.data)
                        print("디바이스 토큰 전송 성공")
                    } catch {
                        print("PostDeviceToken 디코더 오류: \(error)")
                    }
                case .failure(let error):
                    print("PostDeviceToken API 오류: \(error)")
                }
            }
        }
    }
    
    func fetchLogin(username: String, password: String) {
        provider.request(.postLogin(loginData: LoginData(username: username, password: password))) { result in
            switch result {
            case .success(let response):
                do {
                    let decodedData = try JSONDecoder().decode(LoginResponse.self, from: response.data)
                    let result = decodedData.result
                    
                    let userInfo = UserInfo(
                        accessToken: result.accessToken,
                        refreshToken: result.refreshToken
                    )
                    let saved = KeychainManager.standard.saveSession(userInfo, for: "appNameUser")
                    
                    if saved {
                        print("로그인 성공")
                        DispatchQueue.main.async {
                            // 로그인 상태 변경
                            self.isLogin = true
                        }
                    } else{
                        print("로그인 실패: \(decodedData.message)")
                    }
                } catch {
                    print("PostLogin 디코더 오류: \(error)")
                }
            case .failure(let error):
                print("PostLogin API 오류: \(error)")
            }
        }
    }
    
    // 네이버 로그인
    func naverLogin() {
        NidOAuth.shared.requestLogin { result in
            switch result {
            case .success(let response):
                let accessToken = response.accessToken.tokenString
                print("Access Token: ", accessToken)
                
                self.provider.request(.postNaver(accessToken: accessToken)) { r in
                    switch r {
                    case .success(let response):
                        do {
                            let decodedData = try JSONDecoder().decode(LoginResponse.self, from: response.data)
                            
                            let userInfo = UserInfo(
                                accessToken: decodedData.result.accessToken,
                                refreshToken: decodedData.result.refreshToken
                            )
                            
                            // 토큰 KeyChain에 저장
                            let saved = KeychainManager.standard.saveSession(userInfo, for: "appNameUser")
                            if saved {
                                print("Token 저장 성공: \(String(describing: userInfo.accessToken))")
                                self.isLogin = true // 화면 전환
                            } else {
                                print("Token 저장 실패")
                            }
                        } catch {
                            print("Naver Login 디코더 오류: \(error)")
                        }
                    case .failure(let error):
                        print("Naver Login API 오류: \(error)")
                    }
                }
            case .failure(let error):
                print("Error: ", error.localizedDescription)
            }
        }
    }
    
    // 카카오 로그인
    func kakaoLogin() {
        func kakaoLogin(accessToken: String) {
            provider.request(.postKakao(accessToken: accessToken)) { result in
                switch result {
                case .success(let response):
                    do {
                        let decodedData = try JSONDecoder().decode(LoginResponse.self, from: response.data)
                        
                        let userInfo = UserInfo(
                            accessToken: decodedData.result.accessToken,
                            refreshToken: decodedData.result.refreshToken
                        )
                        
                        // 토큰 KeyChain에 저장
                        let saved = KeychainManager.standard.saveSession(userInfo, for: "appNameUser")
                        if saved {
                            print("Token 저장 성공: \(String(describing: userInfo.accessToken))")
                            self.isLogin = true // 화면 전환
                        } else {
                            print("Token 저장 실패")
                        }
                    } catch {
                        print("KakaoResponse 디코더 오류: \(error)")
                    }
                case .failure(let error):
                    print("Kakao Login Error: \(error)")
                }
            }
        }
        
        // 카카오톡 실행 가능 여부 확인
        if UserApi.isKakaoTalkLoginAvailable() {
            // 카카오톡 로그인
            UserApi.shared.loginWithKakaoTalk { oauthToken, error in
                if let error = error {
                    print(error)
                } else {
                    if let accessToken = oauthToken?.accessToken {
                        kakaoLogin(accessToken: accessToken)
                    }
                }
            }
        } else {
            // 카카오계정 로그인
            UserApi.shared.loginWithKakaoAccount { oauthToken, error in
                if let error = error {
                    print(error)
                } else {
                    if let accessToken = oauthToken?.accessToken {
                        kakaoLogin(accessToken: accessToken)
                    }
                }
            }
        }
    }
    
    /// Apple 로그인 시작
    func loginWithApple(presentationAnchor: ASPresentationAnchor) async {
        do {
            let credential = try await AppleLoginManager.shared.startSignInWithAppleFlow(presentationAnchor: presentationAnchor)
            try await handleLoginSuccess(credential: credential)
            isLoggedIn = true
        } catch {
            errorMessage = "로그인 실패: \(error.localizedDescription)"
            isLoggedIn = false
        }
    }
    
    /// 로그인 성공 후 처리
    private func handleLoginSuccess(credential: ASAuthorizationAppleIDCredential) async throws {
        self.userIdentifier = credential.user
        
        if let nameComponents = credential.fullName {
            let formatter = PersonNameComponentsFormatter()
            self.fullName = formatter.string(from: nameComponents)
        }
        
        self.email = credential.email ?? ""
        
        // identityToken, authorizationCode 추출
        guard let identityToken = credential.identityToken,
              let identityTokenString = String(data: identityToken, encoding: .utf8),
              let authorizationCode = credential.authorizationCode,
              let authorizationCodeString = String(data: authorizationCode, encoding: .utf8) else {
            throw NSError(domain: "AppleTokenError", code: -2)
        }
        
        // 서버에 로그인 요청
        appleLogin(code: authorizationCodeString)
    }
    
    func appleLogin(code: String) {
        appleProvider.request(.postApple(code: code)) { result in
            switch result {
            case .success(let response):
                do {
                    let decodedData = try JSONDecoder().decode(LoginResponse.self, from: response.data)
                } catch {
                    print("PostApple 디코더 오류: \(error)")
                }
            case .failure(let error):
                print("PostApple API 오류: \(error)")
            }
        }
    }
}

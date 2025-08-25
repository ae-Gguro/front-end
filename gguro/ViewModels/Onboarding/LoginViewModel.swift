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

class LoginViewModel: NSObject, ObservableObject {
    private let fcmProvider = APIManager.shared.createProvider(for: NotificationRouter.self)
    private let provider = APIManager.shared.createProvider(for: OnboardingRouter.self)
    
    @Published var isLogin: Bool = false
    
    // 애플 로그인
    @Published var givenName: String = ""
    @Published var errorMessage: String = ""
    @Published var oauthUserData = OAuthUserData()
    
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
    
    // 애플 로그인
    func appleLogin() {
        let appleIDProvider = ASAuthorizationAppleIDProvider() // Apple ID 제공자 생성
        let request = appleIDProvider.createRequest() // 인증 요청 생성
        request.requestedScopes = [.fullName, .email] // 전체 이름, 이메일 요청
        
        // 인증 요청 처리 컨트롤러 생성
        let authorizationController = ASAuthorizationController(authorizationRequests: [request])
        authorizationController.delegate = self
        authorizationController.presentationContextProvider = self
        authorizationController.performRequests()
    }
    
    func appleLogout() {
        
    }
}

// MARK: - Extension

// 애플 로그인
extension LoginViewModel: ASAuthorizationControllerPresentationContextProviding, ASAuthorizationControllerDelegate {
    // 연동 성공
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        switch authorization.credential {
        case let appleIDCredential as ASAuthorizationAppleIDCredential:
            let userIdentifier = appleIDCredential.user
            let fullName = appleIDCredential.fullName
            let idToken = appleIDCredential.identityToken!
            
            oauthUserData.oauthId = userIdentifier
            oauthUserData.idToken = String(data: idToken, encoding: .utf8) ?? ""
            
            if let givenName = fullName?.givenName, let familyName = fullName?.familyName {
                self.givenName = "\(givenName) \(familyName)"
            }
            
            // 로그인 상태 변경
            self.isLogin = true
        default:
            break
        }
    }
    
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let window = windowScene.windows.first {
            return window
        }
        fatalError("No window found")
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: any Error) {
        errorMessage = "Authorization failed: \(error.localizedDescription)"
    }
}

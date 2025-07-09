//
//  AppleLoginViewModel.swift
//  gguro
//
//  Created by 김미주 on 7/9/25.
//

import SwiftUI
import AuthenticationServices

class AppleLoginViewModel: NSObject, ObservableObject {
    @Published var givenName: String = ""
    @Published var errorMessage: String = ""
    @Published var oauthUserData = OAuthUserData()
    
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

extension AppleLoginViewModel: ASAuthorizationControllerPresentationContextProviding, ASAuthorizationControllerDelegate {
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

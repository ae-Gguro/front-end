//
//  KakaoLoginButton.swift
//  gguro
//
//  Created by 김미주 on 6/29/25.
//

import SwiftUI
import KakaoSDKCommon
import KakaoSDKAuth
import KakaoSDKUser

struct KakaoLoginButton: View {
    let viewModel: KakakoLoginViewModel = .init()
    
    var body: some View {
        Button(action: {
            if (UserApi.isKakaoTalkLoginAvailable()) {
                UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
                    if let error = error {
                        print("카카오 로그인 오류: \(error)")
                    }
                    if let oauthToken = oauthToken {
                        print("카카오 로그인 성공: \(oauthToken)")
                        viewModel.postKakaoLogin(oauthToken.accessToken)
                    }
                }
            } else {
                UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
                    if let error = error {
                        print("카카오 로그인 오류: \(error)")
                    }
                    if let oauthToken = oauthToken {
                        print("카카오 로그인 성공: \(oauthToken)")
                        viewModel.postKakaoLogin(oauthToken.accessToken)
                    }
                }
            }
        }) {
            Image(.iconLoginKakao)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 90, height: 90)
        }
    }
}

#Preview {
    KakaoLoginButton()
}

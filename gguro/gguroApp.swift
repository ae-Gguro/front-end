//
//  gguroApp.swift
//  gguro
//
//  Created by 김미주 on 5/21/25.
//

import SwiftUI
import KakaoSDKCommon
import KakaoSDKAuth

@main
struct gguroApp: App {
    init() {
        KakaoSDK.initSDK(appKey: "eebb1242e2da80fe103994d0366c0671")
    }
    
    var body: some Scene {
        WindowGroup {
            OnboardingContainer()
                .onOpenURL { url in
                    if (AuthApi.isKakaoTalkLoginUrl(url)) {
                        _ = AuthController.handleOpenUrl(url: url)
                    }
                }
        }
    }
}

//
//  LoginView.swift
//  gguro
//
//  Created by 김미주 on 5/21/25.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        ZStack {
            BackgroundImage()
            
            HStack {
                KakaoLoginButton()
                AppleLoginButton()
            }
        }
    }
}

#Preview {
    LoginView()
}

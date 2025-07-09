//
//  AppleLoginButton.swift
//  gguro
//
//  Created by 김미주 on 6/29/25.
//

import SwiftUI
import AuthenticationServices

struct AppleLoginButton: View {
    @StateObject private var appleViewModel = AppleLoginViewModel()
    
    var body: some View {
        Button(action: {
            appleViewModel.appleLogin()
        }) {
            Image(.iconLoginApple)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 90, height: 90)
        }
    }
}

#Preview {
    AppleLoginButton()
}

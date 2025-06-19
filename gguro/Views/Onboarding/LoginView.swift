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
            
            VStack {
                Text("Pretendard 프리텐다드")
                    .font(.PretendardSemiBold32)
                Text("NanumSquareRound 나눔스퀘어라운드")
                    .font(.NanumExtraBold32)
            }
        }
    }
}

#Preview {
    LoginView()
}

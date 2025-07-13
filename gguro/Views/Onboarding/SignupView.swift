//
//  SignupView.swift
//  gguro
//
//  Created by 김미주 on 5/21/25.
//

import SwiftUI

struct SignupView: View {
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            BackgroundImage()
            
            BackButton(color: "red")
                .padding(.leading, 70)
                .padding(.top, 60)
            
                VStack(spacing: 24) {
                    ZStack {
                        Rectangle()
                            .fill(.red1)
                            .frame(width: 120, height: 120)
                            .cornerRadius(20)
                        Text("LOGO")
                            .foregroundStyle(.white)
                    }
                    Spacer().frame(height: 11)
                    InputWithTitle(title: "아이디", placeholder: "아이디를 입력하세요.")
                    InputWithTitle(title: "보호자 이름", placeholder: "이름을 입력하세요.")
                    InputWithTitle(title: "비밀번호", placeholder: "비밀번호를 입력하세요.")
                    InputWithTitle(title: "비밀번호 확인", placeholder: "비밀번호를 다시 입력하세요.")
                    
                    Spacer().frame(height: 66)
                    
                    ProfileButton(color: "red", title: "회원가입")
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            

        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    SignupView()
}

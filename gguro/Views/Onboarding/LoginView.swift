//
//  LoginView.swift
//  gguro
//
//  Created by 김미주 on 5/21/25.
//

import SwiftUI

struct LoginView: View {
    @State private var path = NavigationPath()
    @State private var isLoginSuccess = false
    
    var body: some View {
        NavigationStack(path: $path) {
            ZStack {
                BackgroundImage()
                
                VStack {
                    Spacer().frame(height: 163)
                    ZStack {
                        Rectangle()
                            .fill(.red1)
                            .frame(width: 160, height: 160)
                            .cornerRadius(20)
                        Text("LOGO")
                            .foregroundStyle(.white)
                    }
                    Spacer().frame(height: 70)
                    
                    InputLogin(placeholder: "아이디를 입력해 주세요.", isPassword: false)
                        .frame(alignment: .center)
                    
                    Spacer().frame(height: 25)
                    
                    InputLogin(placeholder: "비밀번호를 입력해 주세요.", isPassword: true)
                        .frame(alignment: .center)
                    
                    Spacer().frame(height: 50)
                    
                    ProfileButton(color: "red", title: "로그인")
                    
                    Spacer().frame(height: 80)
                    
                    Button(action:{
                        path.append("Signup")
                    }){
                        Text("회원가입하기")
                            .font(.PretendardSemiBold24)
                            .foregroundStyle(.gray1)
                            .underline(true, color: .gray1)
                    }
                    
                    Spacer().frame(height: 35)
                    
                    HStack(spacing: 50){
                        KakaoLoginButton(isLoginSuccess: $isLoginSuccess)
                        AppleLoginButton()
                    }
                }
            }
            .navigationDestination(for: String.self) {value in
                    SignupView()
            }
            .navigationDestination(isPresented: $isLoginSuccess) {
                ProfileSelectView()
            }
            .navigationBarBackButtonHidden(true)
            
        }
        
    }
}

#Preview {
    LoginView()
}

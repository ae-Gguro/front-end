//
//  LoginView.swift
//  gguro
//
//  Created by 김미주 on 5/21/25.
//

import SwiftUI

struct LoginView: View {
    @Environment(NavigationRouter<OnboardingRoute>.self) private var router
    @StateObject private var viewModel = LoginViewModel()
    
    var body: some View {
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
                    router.push(.signup)
                }){
                    Text("회원가입하기")
                        .font(.PretendardSemiBold24)
                        .foregroundStyle(.gray1)
                        .underline(true, color: .gray1)
                }
                
                Spacer().frame(height: 35)
                
                HStack(spacing: 50){
                    // 카카오 로그인
                    Button(action: {
                        viewModel.kakaoLogin()
                    }) {
                        Image(.iconLoginKakao)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 90, height: 90)
                    }
                    
                    // 애플 로그인
                    Button(action: {
                        viewModel.appleLogin()
                    }) {
                        Image(.iconLoginApple)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 90, height: 90)
                    }
                }
            }
        }
        .onChange(of: viewModel.isLogin, {
            viewModel.fetchFcmToken()
        })
        .fullScreenCover(isPresented: $viewModel.isLogin) {
            ProfileContainer()
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    LoginView()
}

//
//  SignupView.swift
//  gguro
//
//  Created by 김미주 on 5/21/25.
//

import SwiftUI

struct SignupView: View {
    @Environment(NavigationRouter<OnboardingRoute>.self) private var router
    @StateObject private var viewModel = SignupViewModel()
    
    @State private var id: String = ""
    @State private var name: String = ""
    @State private var password: String = ""
    @State private var checkPassword: String = ""
    
    private var isAllFilled: Bool {
        !id.isEmpty && !name.isEmpty && !password.isEmpty && !checkPassword.isEmpty
    }
    private var isPasswordMismatch: Bool {
        !password.isEmpty && !checkPassword.isEmpty && (password != checkPassword)
    }
    private var canSubmit: Bool {
        isAllFilled && !isPasswordMismatch
    }
    
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
                
                InputWithTitle(title: "아이디", placeholder: "아이디를 입력하세요.", text: $id)
                InputWithTitle(title: "보호자 이름", placeholder: "이름을 입력하세요.", text: $name)
                InputWithTitle(title: "비밀번호", placeholder: "비밀번호를 입력하세요.", isPassword: true, text: $password)
                VStack(alignment: .leading, spacing: 10) {
                    InputWithTitle(title: "비밀번호 확인", placeholder: "비밀번호를 다시 입력하세요.", isPassword: true, text: $checkPassword)
                    if isPasswordMismatch {
                        Text("비밀번호가 일치하지 않습니다.")
                            .font(.NanumBold18)
                            .foregroundStyle(.red1)
                            .padding(.leading, 20)
                    }
                }
                
                Spacer().frame(height: 66)
                
                ProfileButton(color: "red", title: "회원가입", isEnabled: canSubmit, action: {
                    viewModel.fetchSignup(id: id, name: name, password: password, checkPassword: checkPassword)
                })
                .disabled(!canSubmit)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
        }
        .navigationBarBackButtonHidden()
        .onChange(of: viewModel.isSuccess) {
            router.pop()
        }
    }
}

#Preview {
    SignupView()
        .environment(NavigationRouter<OnboardingRoute>())
}

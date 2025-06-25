//
//  ProfileCreateView.swift
//  gguro
//
//  Created by 김미주 on 5/21/25.
//

import SwiftUI

struct ProfileCreateView: View {
    var body: some View {
        ZStack {
            BackgroundImage()
            
            VStack(spacing: 30) {
                ProfileImageUploadButton()
                
                InputWithTitle(title: "이름", placeholder: "이름을 입력해 주세요.")
                InputWithBirth()
                
                Spacer()
                    .frame(height: 110)
                
                ProfileButton(color: "red", title: "프로필 추가")
            }
        }
        .toolbar(.hidden)
    }
}

#Preview {
    ProfileCreateView()
}

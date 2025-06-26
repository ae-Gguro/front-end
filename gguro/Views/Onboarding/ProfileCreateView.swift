//
//  ProfileCreateView.swift
//  gguro
//
//  Created by 김미주 on 5/21/25.
//

import SwiftUI

struct ProfileCreateView: View {
    var body: some View {
        ZStack(alignment: .topLeading) {
            BackgroundImage()
            
            BackButton(color: "red")
                .padding(.leading, 70)
                .padding(.top, 60)
            
            VStack(spacing: 30) {
                Spacer().frame(height: 40)
                
                ProfileImageUploadButton()
                
                InputWithName()
                InputWithBirth()
                
                Spacer().frame(height: 110)
                
                ProfileButton(color: "red", title: "프로필 추가")
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .toolbar(.hidden)
    }
}

#Preview {
    ProfileCreateView()
}

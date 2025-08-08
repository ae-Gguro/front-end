//
//  ProfileEditView.swift
//  gguro
//
//  Created by 김미주 on 7/15/25.
//

import SwiftUI

struct ProfileEditView: View {
    var body: some View {
        ZStack(alignment: .topLeading) {
            BackgroundImage()
            
            BackButton(color: "blue")
                .padding(.leading, 70)
                .padding(.top, 60)
            
            VStack(spacing: 30) {
                Spacer().frame(height: 40)
                
//                ProfileImageUploadButton()
                
//                InputWithName()
//                InputWithBirth()
                
                Spacer().frame(height: 110)
                
                ProfileButton(color: "blue", title: "프로필 수정")
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

#Preview {
    ProfileEditView()
}

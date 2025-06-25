//
//  ProfileImageUploadButton.swift
//  gguro
//
//  Created by 김미주 on 6/26/25.
//

import SwiftUI

struct ProfileImageUploadButton: View {
    var body: some View {
        VStack(spacing: 15) {
            ZStack {
                RoundedRectangle(cornerRadius: 30)
                    .fill(.gray3)
                    .insetShadow(cornerRadius: 30)
                    .frame(width: 160, height: 160)
                Image(.iconPlus)
                    .resizable()
                    .frame(width: 52, height: 52)
            }
            
            Text("프로필 사진")
                .font(.NanumExtraBold28)
                .foregroundStyle(.black1)
        }
        .buttonStyle(.plain) // 탭 효과 없애기
    }
}

#Preview {
    ProfileImageUploadButton()
}

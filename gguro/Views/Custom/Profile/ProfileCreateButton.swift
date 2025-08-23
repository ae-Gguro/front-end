//
//  ProfileAddLarge.swift
//  gguro
//
//  Created by 김미주 on 6/26/25.
//

import SwiftUI

struct ProfileCreateButton: View {
    @Environment(NavigationRouter<ProfileRoute>.self) private var router
    
    var type: ProfileCreateType
    
    var body: some View {
        Button(action: {
            router.push(.profileCreate)
            print("path after push:", router.path)
        }) {
            VStack(spacing: 15) {
                ZStack {
                    RoundedRectangle(cornerRadius: 30)
                        .fill(.gray3.shadow(.inner(color: .shadowWhite, radius: 7)))
                        .frame(width: 260, height: 260)
                    Image(.iconPlus)
                        .resizable()
                        .frame(width: 85, height: 85)
                }
                
                Text("프로필 생성")
                    .font(.NanumExtraBold36)
                    .foregroundStyle(.black1)
            }
        }
        .buttonStyle(.plain) // 탭 효과 없애기
    }
}

#Preview {
    ProfileCreateButton(type: .onboarding)
}

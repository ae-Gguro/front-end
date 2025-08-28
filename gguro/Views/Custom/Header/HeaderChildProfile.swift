//
//  HeaderChildProfile.swift
//  gguro
//
//  Created by 김미주 on 7/13/25.
//

import SwiftUI
import Kingfisher

struct HeaderChildProfile: View {
    @EnvironmentObject var viewModel: ProfileSelectViewModel
    
    var color: ProfileColor
    var profile: ProfileListProfile
    var isEnabled: Bool = false // 비활성과가 디폴트
    
    var body: some View {
        Button(action: {
            viewModel.selectedProfileId = profile.profileId
        }) {
            profileGroup
                .compositingGroup() // 하나의 뷰로 만듦 (투명도 조절에 필요)
                .opacity(isEnabled ? 1.0 : 0.5)
        }
        .buttonStyle(.plain)
    }
    
    private var profileGroup: some View {
        VStack(spacing: -16) {
            ZStack {
                Circle()
                    .fill(color.sub)
                    .frame(width: 88, height: 88)
                
                if let url = URL(string: profile.profileImageUrl) {
                    KFImage(url)
                        .placeholder {
                            ProgressView()
                                .controlSize(.mini)
                        }
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 77, height: 77)
                        .clipShape( Circle() )
                }
            }
            
            ZStack {
                RoundedRectangle(cornerRadius: 6)
                    .fill(color.main)
                    .frame(width: 88, height: 32)
                
                Text(profile.profileName)
                    .font(.NanumExtraBold19)
                    .foregroundStyle(.white)
            }
        }
    }
}

//#Preview {
//    HeaderChildProfile(color: .red, name: "은서")
//}

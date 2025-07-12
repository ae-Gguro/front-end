//
//  HeaderChildProfile.swift
//  gguro
//
//  Created by 김미주 on 7/13/25.
//

import SwiftUI

struct HeaderChildProfile: View {
    var color: ProfileColor
//    var image: UIImage
    var name: String
    var isEnabled: Bool = false // 비활성과가 디폴트
    
    var body: some View {
        Button(action: {}) { // TODO: action
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
                
                Circle() // 프로필 임시 도형
                    .fill(.white)
                    .frame(width: 77, height: 77)
            }
            
            ZStack {
                RoundedRectangle(cornerRadius: 6)
                    .fill(color.main)
                    .frame(width: 88, height: 32)
                
                Text(name)
                    .font(.NanumExtraBold19)
                    .foregroundStyle(.white)
            }
        }
    }
}

#Preview {
    HeaderChildProfile(color: .red, name: "은서")
}

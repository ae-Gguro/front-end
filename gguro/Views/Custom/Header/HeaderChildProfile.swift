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
    
    var body: some View {
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

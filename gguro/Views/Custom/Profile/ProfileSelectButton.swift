//
//  ProfileSelectButton.swift
//  gguro
//
//  Created by 김미주 on 8/8/25.
//

import SwiftUI
import Kingfisher

struct ProfileSelectButton: View {
    let profileImg: String?
    let name: String
    
    var body: some View {
        NavigationLink(destination: ChildrenMainView()) {
            VStack(spacing: 15) {
                if let imageUrl = profileImg,
                   let url = URL(string: imageUrl) {
                    KFImage(url)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 260, height: 260)
                        .clipShape(RoundedRectangle(cornerRadius: 30))
                } else {
                    RoundedRectangle(cornerRadius: 30)
                        .fill(.gray1)
                        .frame(width: 260, height: 260)
                }
                
                Text(name)
                    .font(.NanumExtraBold36)
                    .foregroundStyle(.black1)
            }
        }
        .buttonStyle(.plain) // 탭 효과 없애기
    }
}

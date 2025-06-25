//
//  ProfileSelectView.swift
//  gguro
//
//  Created by 김미주 on 5/21/25.
//

import SwiftUI

struct ProfileSelectView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                BackgroundImage()
                
                VStack(spacing: 103) {
                    MessageBox(content:
                                Text("아이의 ") +
                               Text("프로필").foregroundStyle(.red1) +
                               Text("을 선택해 주세요!")
                    )
                    ProfileCreateButton()
                }
            }
            .toolbar(.hidden)
        }
    }
}

#Preview {
    ProfileSelectView()
}

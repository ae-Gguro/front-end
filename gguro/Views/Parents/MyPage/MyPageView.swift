//
//  MyPageView.swift
//  gguro
//
//  Created by 김미주 on 6/4/25.
//

import SwiftUI

struct MyPageView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                BackgroundImage()
                
                VStack(spacing: 0) {
                    ParentsHeaderView()
                    
                    Spacer().frame(height: 112)
                    
                    MessageBox(content:
                                Text("아이의 ") +
                               Text("프로필").foregroundStyle(.red1) +
                               Text("을 선택해 주세요!")
                    )
                    
                    Spacer().frame(height: 103)
                    
                    HStack {
                        ProfileCreateButton(type: .parents)
                    }
                    
                    Spacer()
                }
            }
            .toolbar(.hidden)
        }
    }
}

#Preview {
    MyPageView()
}

//
//  HeaderView.swift
//  gguro
//
//  Created by 김미주 on 7/13/25.
//

import SwiftUI

struct ParentsHeaderView: View {
    var body: some View {
        HStack(spacing: 25) {
            ProfileGroup
            
            Spacer()
            
            MenuGroup
        }
        .padding(.top, 30)
        .padding(.leading, 40)
        .padding(.trailing, 30)
    }
    
    private var ProfileGroup: some View {
        HStack(spacing: 25) {
            HeaderChildProfile(color: .red, name: "은서", isEnabled: true)
            HeaderChildProfile(color: .purple, name: "미주")
        }
    }
    
    private var MenuGroup: some View {
        HStack(spacing: 20) {
            HeaderMenu(type: .children)
            HeaderMenu(type: .mypage)
            HeaderMenu(type: .home)
        }
    }
}

#Preview {
    ParentsHeaderView()
}

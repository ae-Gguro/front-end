//
//  HeaderMenu.swift
//  gguro
//
//  Created by 김미주 on 7/13/25.
//

import SwiftUI

struct HeaderMenu: View {
    var type: HeaderMenuType
    
    var body: some View {
        Button(action: {}) { // TODO: action
            ZStack {
                Circle()
                    .fill(.white)
                    .frame(width: 104, height: 104)
                    .shadow(color: .black.opacity(0.06), radius: 12)
                
                VStack(spacing: 2) {
                    type.icon
                    
                    Text(type.title)
                        .font(.NanumBold15)
                        .foregroundStyle(.black2)
                }

            }
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    HeaderMenu(type: .children)
}

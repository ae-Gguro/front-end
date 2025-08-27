//
//  ProfileButton.swift
//  gguro
//
//  Created by 김미주 on 6/26/25.
//

import SwiftUI

struct ProfileButton: View {
    var color: String
    var title: String
    var isEnabled: Bool = true
    var action: () -> Void = {}
    
    var foreground: Color {
        if isEnabled {
            if color == "red" {
                return .red1
            } else {
                return .blue1
            }
        } else {
            return .gray1
        }
    }
    
    var shadow: Color {
        if isEnabled {
            if color == "red" {
                return .shadowRed
            } else {
                return .shadowBlue
            }
        } else {
            return .black1.opacity(0.3)
        }
    }
    
    var body: some View {
        Button(action: action) {
            ZStack {
                RoundedRectangle(cornerRadius: 40)
                    .fill(foreground.shadow(.inner(color: shadow, radius: 7)))
                    .frame(width: 400, height: 70)
                Text(title)
                    .font(.NanumExtraBold32)
                    .foregroundStyle(.white)
            }
        }
    }
}

#Preview {
    ProfileButton(color: "blue", title: "테스트")
}

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
    var action: () -> Void = {}
    
    var foreground: Color {
        if color == "red" {
            return .red1
        } else {
            return .blue1
        }
    }
    
    var shadow: Color {
        if color == "red" {
            return .shadowRed
        } else {
            return .shadowBlue
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

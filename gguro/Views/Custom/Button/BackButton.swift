//
//  BackButton.swift
//  gguro
//
//  Created by 김미주 on 6/27/25.
//

import SwiftUI

struct BackButton: View {
    var color: String
    
    @Environment(\.dismiss) var dismiss
    
    var foreground: Color {
        if color == "red" {
            return .red1
        } else {
            return .blue1
        }
    }
    
    var body: some View {
        Button(action: { dismiss() }) {
            ZStack {
                Circle()
                    .fill(.white.shadow(.inner(color: .shadowWhite, radius: 7)))
                    .frame(width: 90, height: 90)
                
                HStack {
                    Image(.iconBack)
                        .resizable()
                        .frame(width: 29, height: 45)
                        .foregroundStyle(foreground)
                    
                    Spacer().frame(width: 3)
                }
            }
        }
    }
}

#Preview {
    BackButton(color: "red")
}

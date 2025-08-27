//
//  CategoryButton.swift
//  gguro
//
//  Created by 이채은 on 7/15/25.
//

import SwiftUI

struct CategoryButton: View {
    var text: String
    var img: Image
    var action: () -> Void
    
    @Binding var isSelected: Bool
    
    var body: some View {
            Button(action: {
                action()
                isSelected = true
            }) {
                ZStack {
                    RoundedRectangle(cornerRadius: 25)
                        .fill(.white.shadow(.inner(color: .shadowWhite, radius: 7)))
                        .frame(width: 489, height: 167)
                        .overlay(
                              RoundedRectangle(cornerRadius: 25)
                                    .stroke(isSelected ? Color.red1 : Color.clear, lineWidth: 5)
                        )
                    HStack(spacing: 28) {
                        ZStack {
                            Circle()
                                .strokeBorder(.red2, lineWidth: 1)
                                .frame(width: 120, height: 120)
                                .background(Circle().fill(.red3))
                            img
                                .resizable()
                                .frame(width: 90, height: 90)
                        }
                        Text(text)
                            .foregroundStyle(.black1)
                            .font(.NanumExtraBold48)
                            .frame(width: 261)
                            
                    }
                }
            }
        
    }
}

//#Preview {
//    CategoryButton(text: "옷 입기", img: Image(.iconCloth))
//}

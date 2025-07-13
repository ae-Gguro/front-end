//
//  SelectButton.swift
//  gguro
//
//  Created by 이채은 on 7/14/25.
//

import SwiftUI

struct SelectButton: View {
    var text: String
    
    var body: some View {
            Button(action: {
                //TODO: action 추가 예정
            }) {
                ZStack {
                    RoundedRectangle(cornerRadius: 18.9)
                        .fill(.red1.shadow(.inner(color: .shadowRed, radius: 7)))
                        .frame(width: 265, height: 75.7)
                    Text(text)
                        .foregroundStyle(.white)
                        .font(.NanumExtraBold28)
                }
            }
        
    }
}

#Preview {
    SelectButton(text: "계속 대화하기")
}

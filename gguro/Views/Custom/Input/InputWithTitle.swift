//
//  InputWithTitle.swift
//  gguro
//
//  Created by 김미주 on 6/26/25.
//

import SwiftUI

struct InputWithTitle: View {
    var title: String
    var placeholder: String
    var isPassword: Bool = false
    
    @State var text: String = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(title)
                .font(.NanumExtraBold28)
                .foregroundStyle(.black2)
                .padding(.leading, 15)
            
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 20)
                    .fill(.white.shadow(.inner(color: .shadowWhite, radius: 7)))
                    .frame(width: 600, height: 60)
                
                if !isPassword {
                    TextField(placeholder, text: $text)
                        .font(.NanumExtraBold24)
                        .foregroundStyle(.black2)
                        .padding(.horizontal, 30)
                } else {
                    SecureField(placeholder, text: $text)
                        .font(.NanumExtraBold24)
                        .foregroundStyle(.black2)
                        .padding(.horizontal, 30)
                }
            }
        }
        .frame(width: 600)
    }
}

#Preview {
    InputWithTitle(title: "테스트", placeholder: "테스트입니다.")
}

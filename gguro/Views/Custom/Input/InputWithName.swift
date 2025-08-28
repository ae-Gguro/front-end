//
//  InputWithName.swift
//  gguro
//
//  Created by 김미주 on 6/27/25.
//

import SwiftUI

struct InputWithName: View {
    @Binding var lastName: String
    @Binding var firstName: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("이름")
                .font(.NanumExtraBold28)
                .foregroundStyle(.black2)
                .padding(.leading, 15)
            
            HStack(spacing: 20) {
                NameTextField(placeholder: "성", text: $lastName)
                NameTextField(placeholder: "이름", text: $firstName)
            }
        }
        .frame(width: 600)
    }
}

struct NameTextField: View {
    var placeholder: String
    
    @Binding var text: String
    
    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 20)
                .fill(.white.shadow(.inner(color: .shadowWhite, radius: 7)))
                .frame(width: 290, height: 60)
            
            TextField(placeholder, text: $text)
                .font(.NanumExtraBold24)
                .foregroundStyle(.black2)
                .padding(.horizontal, 30)
        }
    }
}

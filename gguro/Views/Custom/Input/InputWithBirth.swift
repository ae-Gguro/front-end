//
//  InputWithBirth.swift
//  gguro
//
//  Created by 김미주 on 6/26/25.
//

import SwiftUI

struct InputWithBirth: View {
    @State var year: String = ""
    @State var month: String = ""
    @State var day: String = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("생년월일")
                .font(.NanumExtraBold28)
                .foregroundStyle(.black2)
                .padding(.leading, 15)
            
            HStack(spacing: 20) {
                BirthTextField(placeholder: "연도", width: 280, text: $year)
                BirthTextField(placeholder: "월", width: 140, text: $month)
                BirthTextField(placeholder: "일", width: 140, text: $day)
            }
        }
        .frame(width: 600)
    }
}

struct BirthTextField: View {
    var placeholder: String
    var width: CGFloat
    
    @Binding var text: String
    
    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 20)
                .fill(.white.shadow(.inner(color: .shadowWhite, radius: 7)))
                .frame(width: width, height: 60)
            
            TextField(placeholder, text: $text)
                .font(.NanumExtraBold24)
                .foregroundStyle(.black2)
                .padding(.horizontal, 30)
        }
    }
}

#Preview {
    InputWithBirth()
}

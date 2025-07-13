//
//  InputLogin.swift
//  gguro
//
//  Created by 이채은 on 7/13/25.
//

import SwiftUI

struct InputLogin: View {
    var placeholder: String = ""
    var isPassword: Bool = false
    
    @State private var text: String = ""
    
    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .fill(.white.shadow(.inner(color: .shadowWhite, radius: 7)))
                    .frame(width: 600, height: 80)
                    .foregroundStyle(.white)
                
                if !isPassword {
                    TextField(placeholder, text: $text)
                        .padding(.horizontal, 30)
                        .frame(width: 600, height: 80, alignment: .leading)
                        .font(.NanumExtraBold32)
                        .foregroundStyle(.black2)
                        .textInputAutocapitalization(.never)
                        .disableAutocorrection(true)
                        .onChange(of: text, initial: false) {
                            if text.count > 27 {
                                text = String(text.prefix(27))
                            }
                        }
                        .frame(alignment: .center)
                } else {
                    SecureField(placeholder, text: $text)
                        .padding(.horizontal, 30)
                        .frame(width: 600, height: 80, alignment: .leading)
                        .font(.NanumExtraBold32)
                        .foregroundStyle(.black2)
                        .textInputAutocapitalization(.never)
                        .disableAutocorrection(true)
                        .onChange(of: text, initial: false) {
                            if text.count > 27 {
                                text = String(text.prefix(27))
                            }
                        }
                        .frame(alignment: .center)
                  }
            }
        }
    }
    
}

#Preview {
    InputLogin(placeholder: "테스트예용", isPassword: true)
}

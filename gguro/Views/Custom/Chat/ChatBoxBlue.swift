//
//  ChatBoxBlue.swift
//  gguro
//
//  Created by 김미주 on 7/14/25.
//

import SwiftUI

struct ChatBoxBlue: View {
    var text: String
    
    var body: some View {
        HStack() {
            Spacer()
            
            ChatBubble
        }
        .padding(.horizontal, 70)
    }
    
    // 말풍선
    private var ChatBubble: some View {
        Text(text)
            .font(.NanumExtraBold26)
            .lineSpacing(9)
            .foregroundStyle(.white)
            .padding(.horizontal, 30)
            .padding(.vertical, 15)
            .background {
                HStack(alignment: .bottom, spacing: -15) {
                    RoundedRectangle(cornerRadius: 15)
                        .fill(.blue1)
                    
                    Image(.imgTailBlue)
                }
            }
            .frame(maxWidth: 700, alignment: .trailing)
    }
}

#Preview {
    ChatBoxBlue(text: "응, 알고 있어!\n우리 엄마, 아빠랑 동물원에 가서 본 적 있어!")
}

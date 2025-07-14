//
//  ChatBoxGray.swift
//  gguro
//
//  Created by 김미주 on 7/14/25.
//

import SwiftUI

struct ChatBoxGray: View {
    var text: String
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            HStack(alignment: .bottom, spacing: 15) {
                ChatBubble
                
                ButtonGroup
                
                Spacer()
            }
        }
        .padding(.horizontal, 70)
    }
    
    // 말풍선
    private var ChatBubble: some View {
        Text(text)
            .font(.NanumExtraBold26)
            .lineSpacing(9)
            .foregroundStyle(.black1)
            .padding(.horizontal, 30)
            .padding(.vertical, 15)
            .background {
                HStack(alignment: .bottom, spacing: -15) {
                    Image(.imgTailGray)
                    
                    RoundedRectangle(cornerRadius: 15)
                        .fill(.gray3)
                }
            }
            .fixedSize(horizontal: false, vertical: true)
    }
    
    // 버튼
    private var ButtonGroup: some View {
        HStack(alignment: .bottom, spacing: 10) {
            Button(action: {}) { // TODO: action
                Image(.iconGood)
            }
            .buttonStyle(.plain)
            
            Button(action: {}) { // TODO: action
                Image(.iconBad)
            }
            .buttonStyle(.plain)
        }
    }
}

#Preview {
    ChatBoxGray(text: "은서야, 오늘은 호랑이에 대해서 알아보는 시간을 가질거야.은서는 호랑이를 알고 있니?은서야, 오늘은 호랑이에 대해서 알아보는 시간을 가질거야.은서는 호랑이를 알고 있니?은서야, 오늘은 호랑이에 대해서 알아보는 시간을 가질거야.은서는 호랑이를 알고 있니?")
    ChatBoxGray(text: "은서는 호랑이를 알고 있니?")
}

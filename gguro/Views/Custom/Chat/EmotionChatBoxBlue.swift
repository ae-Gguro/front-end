//
//  EmotionChatBoxBlue.swift
//  gguro
//
//  Created by 김미주 on 7/14/25.
//

import SwiftUI

struct EmotionChatBoxBlue: View {
    @Environment(NavigationRouter<ParentsRoute>.self) private var router
    
    var text: String
    
    var body: some View {
        HStack(alignment: .top, spacing: 30) {
            Image(.imageGguroHappy)
            
            VStack(alignment: .leading, spacing: 15) {
                ChatBubble
                
                Button(action: {
                    router.push(.conversationDetail)
                }) { // TODO: action
                    Text("대화 내용 보러가기")
                        .font(.NanumExtraBold19)
                        .foregroundStyle(.black1)
                        .frame(width: 200, height: 40)
                        .background {
                            RoundedRectangle(cornerRadius: 20)
                                .fill(.white.shadow(.inner(color: .shadowWhite, radius: 7)))
                        }
                }
                .buttonStyle(.plain)
            }
            
            Spacer()
        }
        .padding(.horizontal, 70)
    }
    
    // 말풍선
    private var ChatBubble: some View {
        Text(text)
            .font(.NanumExtraBold26)
            .foregroundStyle(.white)
            .padding(.horizontal, 40)
            .frame(height: 100)
            .background {
                HStack(alignment: .bottom, spacing: -15) {
                    Image(.imageTail)
                        .foregroundStyle(.blue1)
                    
                    RoundedRectangle(cornerRadius: 15)
                        .fill(.blue1)
                }
            }
    }
}

#Preview {
    EmotionChatBoxBlue(text: "은서는 “삼겹살”이라는 단어에 긍정적으로 반응했어요.")
}

//
//  EmotionChatBoxRed.swift
//  gguro
//
//  Created by 김미주 on 7/14/25.
//

import SwiftUI

struct EmotionChatBoxRed: View {
    @Environment(NavigationRouter<ParentsRoute>.self) private var router
    
    var text: String
    var chatroomId: Int
    var talkId: Int
    
    var body: some View {
        HStack(alignment: .top, spacing: 30) {
            Spacer()
            
            VStack(alignment: .trailing, spacing: 15) {
                ChatBubble
                
                Button(action: {
                    router.push(.conversationDetail(chatroomId: chatroomId, focusTalkId: talkId))
                }) {
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
            
            Image(.imageGguroAngry)
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
                    RoundedRectangle(cornerRadius: 15)
                        .fill(.red1)
                    
                    Image(.imageTail)
                        .foregroundStyle(.red1)
                        .scaleEffect(x: -1, y:1)
                }
            }
    }
}

//#Preview {
//    EmotionChatBoxRed(text: "은서는 '새똥'에 대해 부정적인 반응을 보였어요.")
//}

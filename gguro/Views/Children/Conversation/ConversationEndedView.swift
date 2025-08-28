//
//  ConversationEndedView.swift
//  gguro
//
//  Created by 이채은 on 7/14/25.
//
import SwiftUI

struct ConversationEndedView: View {
    @EnvironmentObject var ws: AIChatWebSocketManager
    
    var body: some View {
        VStack {
            HStack(spacing: -24) {
                Image(.imageGguro)
                    .resizable()
                    .frame(width: 416, height: 416)
                
                Text("오늘도 재밌었어!\n다음에 또 재미있게 이야기하자~")
                    .font(.NanumBold64)
                    .foregroundStyle(.white)
                    .padding(.trailing, 87)
                
            }
            Spacer().frame(height: -36)
            
            HStack(spacing: 15){
                Spacer().frame(width: 682)
                SelectButton(text: "계속 대화하기")
                
                SelectButton(text: "메뉴로 이동")
                    .padding(.trailing, 50)
                
            }
        }
    }
}

#Preview {
    ConversationEndedView()
}

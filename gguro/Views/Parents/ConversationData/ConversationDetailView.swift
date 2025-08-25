//
//  ConversationDetailView.swift
//  gguro
//
//  Created by 김미주 on 7/14/25.
//

import SwiftUI

struct ConversationDetailView: View {
    @State private var viewModel = ConversationDetailViewModel()
    
    var body: some View {
        ZStack {
            BackgroundImage()
            
            VStack(spacing: 24) {
                ParentsHeaderView()
                
                // 상단 메뉴
                ZStack {
                    HStack {
                        BackButton(color: "blue")
                        Spacer()
                    }
                    .padding(.horizontal, 45)
                    
                    MessageBox(content: Text("은서와 AI의 대화 내용"))
                }
                
                // 하단 박스
                ZStack {
                    RoundedRectangle(cornerRadius: 30)
                        .fill(.white.shadow(.inner(color: .shadowWhite, radius: 7)))
                    
                    // 대화 스크롤
                    ScrollView {
                        LazyVStack(spacing: 40) {
                            ForEach(viewModel.conversationSample, id: \.id) { item in
                                if item.role == "bot" {
                                    ChatBoxGray(text: item.content)
                                }
                                
                                if item.role == "user" {
                                    ChatBoxBlue(text: item.content)
                                }
                            }
                        }
                        .padding(.vertical, 40)
                    }
                }
                .padding(.horizontal, 93)
                .padding(.bottom, 60)
            }
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    ConversationDetailView()
}

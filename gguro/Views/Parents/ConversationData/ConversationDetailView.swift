//
//  ConversationDetailView.swift
//  gguro
//
//  Created by 김미주 on 7/14/25.
//

import SwiftUI

struct ConversationDetailView: View {
    @Environment(\.childName) private var childName
    @StateObject private var viewModel = ConversationDetailViewModel()
    
    let chatroomId: Int
    let focusTalkId: Int?
    
    @State private var focusedId: Int? = nil
    @State private var animate = false
    
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
                    
                    MessageBox(content: Text("AI와 \(childName)의 대화 내용"))
                }
                
                // 대화 스크롤
                ZStack {
                    RoundedRectangle(cornerRadius: 30)
                        .fill(.white.shadow(.inner(color: .shadowWhite, radius: 7)))
                    
                    ScrollViewReader { proxy in
                        ScrollView {
                            LazyVStack(spacing: 40) {
                                ForEach(viewModel.conversationList, id: \.id) { item in
                                    Group {
                                        if item.role == "bot" {
                                            ChatBoxGray(text: item.content)
                                        } else if item.role == "user" {
                                            ChatBoxBlue(text: item.content)
                                        }
                                    }
                                    .id(item.id)
                                    .scaleEffect(focusedId == item.id && animate ? 1.05 : 1.0)
                                }
                            }
                            .padding(.vertical, 40)
                        }
                        .scrollIndicators(.hidden)
                        .onChange(of: viewModel.conversationList) {
                            if let focusTalkId = focusTalkId {
                                DispatchQueue.main.async {
                                    proxy.scrollTo(focusTalkId, anchor: .center)
                                    focusedId = focusTalkId
                                    withAnimation(.easeInOut(duration: 0.2)) {
                                        animate = true
                                    }
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                                        animate = false
                                    }
                                }
                            }
                        }

                    }
                }
                .padding(.horizontal, 93)
                .padding(.bottom, 60)
            }
        }
        .navigationBarBackButtonHidden()
        .task {
            viewModel.fetchGetTalks(chatroomId: chatroomId)
        }
    }
}

//#Preview {
//    ConversationDetailView()
//}

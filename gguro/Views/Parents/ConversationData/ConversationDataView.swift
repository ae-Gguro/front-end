//
//  ConversationDataView.swift
//  gguro
//
//  Created by 김미주 on 6/4/25.
//

import SwiftUI

struct ConversationDataView: View {
    @Environment(NavigationRouter<ParentsRoute>.self) private var router
    @EnvironmentObject var profileViewModel: ProfileSelectViewModel
    
    @StateObject private var viewModel = ConversationDataViewModel()
    
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
                
                // 리스트
                ZStack {
                    RoundedRectangle(cornerRadius: 30)
                        .fill(.white.shadow(.inner(color: .shadowWhite, radius: 7)))
                    
                    VStack {
                        VStack(spacing: 0) {
                            ForEach(Array(viewModel.currentPageItems.enumerated()), id: \.element.id) { index, item in
                                ConversationListItem(date: formattedDate(item.createdAt), title: item.topic)
                                    .padding(.vertical, 25)

                                // 마지막 항목이 아니라면 Divider 추가
                                if index < viewModel.currentPageItems.count - 1 {
                                    Divider()
                                        .frame(height: 1)
                                        .overlay(.gray1)
                                        .padding(.horizontal, 57)
                                }
                            }
                            
                            Spacer()
                        }
                        .padding(.top, 25)
                        
                        // 페이지네이션
                        HStack(spacing: 40) {
                            Button(action: {
                                viewModel.goToPage(viewModel.currentPage - 1)
                            }) {
                                Image(.iconPrev)
                            }
                            
                            if viewModel.totalPage > 0 {
                                ForEach(1...viewModel.totalPage, id: \.self) { page in
                                    Button(action: {
                                        viewModel.goToPage(page)
                                    }) {
                                        Text("\(page)")
                                            .font(viewModel.currentPage == page ? .NanumExtraBold30 : .NanumBold30)
                                            .foregroundStyle(viewModel.currentPage == page ? .black1 : .gray1)
                                    }
                                }
                            }
                            
                            Button(action: {
                                viewModel.goToPage(viewModel.currentPage + 1)
                            }) {
                                Image(.iconNext)
                            }
                        }
                        .padding(.bottom, 35)
                    }
                }
                .padding(.horizontal, 93)
                .padding(.bottom, 60)
            }
        }
        .navigationBarBackButtonHidden()
        .task {
            viewModel.fetchGetChatrooms()
        }
    }
    
    // 날짜 포맷
    private func formattedDate(_ dateString: String) -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSSS"

        if let date = formatter.date(from: dateString) {
            let displayFormatter = DateFormatter()
            displayFormatter.locale = Locale(identifier: "ko_KR")
            displayFormatter.dateFormat = "yyyy.MM.dd (E)"
            return displayFormatter.string(from: date)
        }
        return ""
    }
}

struct ConversationListItem: View {
    @Environment(NavigationRouter<ParentsRoute>.self) private var router
    
    var date: String
    var title: String
    
    var body: some View {
        Button(action: {
            router.push(.conversationDetail)
        }) {
            HStack {
                Text(date)
                    .font(.PretendardSemiBold32)
                    .foregroundStyle(.blue1)
                
                Spacer().frame(width: 54)
                
                Text(title)
                    .font(.PretendardRegular32)
                    .foregroundStyle(.black1)
                    .lineLimit(1)
                
                Spacer()
            }
            .padding(.horizontal, 94)
        }
    }
}

#Preview {
    ConversationDataView()
}

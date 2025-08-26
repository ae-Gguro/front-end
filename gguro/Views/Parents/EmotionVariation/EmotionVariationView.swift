//
//  EmotionVariationView.swift
//  gguro
//
//  Created by 김미주 on 6/4/25.
//

import SwiftUI

struct EmotionVariationView: View {
    @Environment(NavigationRouter<ParentsRoute>.self) private var router
    @StateObject private var viewModel = EmotionVariationViewModel()
    @EnvironmentObject private var pViewModel: ParentsViewModel

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
                    
                    MessageBox(content: Text("\(pViewModel.name)의 감정 변화"))
                }
                
                // 하단 박스
                ZStack {
                    RoundedRectangle(cornerRadius: 30)
                        .fill(.white.shadow(.inner(color: .shadowWhite, radius: 7)))
                    
                    // 대화 스크롤
                    ScrollView {
                        LazyVStack(spacing: 40) {
                            ForEach(viewModel.groups) { group in
                                Text(formattedDate(group.dateString))
                                    .font(.NanumExtraBold19)
                                    .foregroundStyle(.white)
                                    .frame(width: 350, height: 40)
                                    .background {
                                        RoundedRectangle(cornerRadius: 20)
                                            .fill(.gray2)
                                    }
                                
                                ForEach(group.items) { item in
                                    if item.positive {
                                        EmotionChatBoxBlue(text: item.text)
                                    } else {
                                        EmotionChatBoxRed(text: item.text)
                                    }
                                }
                            }
                        }
                        .padding(.vertical, 40)
                    }
                    .scrollIndicators(.hidden)
                }
                .padding(.horizontal, 93)
                .padding(.bottom, 60)
            }
        }
        .navigationBarBackButtonHidden()
        .task {
            viewModel.fetchSentimentSummary()
        }
    }
    
    // 날짜 포맷
    private func formattedDate(_ dateString: String) -> String {
        let inputFormatter = DateFormatter()
        inputFormatter.locale = Locale(identifier: "ko_KR")
        inputFormatter.dateFormat = "yyyy-MM-dd"
        
        let outputFormatter = DateFormatter()
        outputFormatter.locale = Locale(identifier: "ko_KR")
        outputFormatter.dateFormat = "yyyy년 M월 d일 E요일"
        
        guard let date = inputFormatter.date(from: dateString) else {
            return dateString // 파싱 실패하면 원래 문자열 반환
        }
        
        return outputFormatter.string(from: date)
    }
}

#Preview {
    EmotionVariationView()
}

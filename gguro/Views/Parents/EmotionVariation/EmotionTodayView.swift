//
//  EmotionTodayView.swift
//  gguro
//
//  Created by 김미주 on 8/23/25.
//

import SwiftUI
import Charts

struct ChartData: Identifiable {
    let id = UUID()
    let emotion: String
    let value: Int
}

struct EmotionTodayView: View {
    @Environment(NavigationRouter<ParentsRoute>.self) private var router
    @StateObject private var viewModel = EmotionTodayViewModel()
    
    let selectedDate: Date

    var body: some View {
        ZStack {
            BackgroundImage()
            
            VStack(spacing: 25) {
                ParentsHeaderView()
                
                // 상단 메뉴
                ZStack {
                    HStack {
                        BackButton(color: "blue")
                        Spacer()
                    }
                    .padding(.horizontal, 45)
                    
                    MessageBox(content: Text("오늘의 감정 분석 리포트"))
                }
                
                // 하단 박스
                ZStack {
                    RoundedRectangle(cornerRadius: 30)
                        .fill(.white.shadow(.inner(color: .shadowWhite, radius: 7)))
                    
                    VStack {
                        Text(Date(), formatter: dateFormatter)
                            .font(.NanumExtraBold16)
                            .foregroundStyle(.white)
                            .background(
                                RoundedRectangle(cornerRadius: 15)
                                    .fill(.gray3)
                                    .frame(width: 300, height: 30)
                            )
                        
                        Spacer()
                        
                        HStack(spacing: 55) {
                            chartGroup
                            
                            VStack(alignment: .leading, spacing: 10) {
                                // 긍정
                                Text("긍정 키워드")
                                
                                ZStack(alignment: .topLeading) {
                                    RoundedRectangle(cornerRadius: 20)
                                        .fill(.gray3)
                                    
                                    ScrollView {
                                        Text((viewModel.dailyReport?.positive_keywords ?? []).joined(separator: ", "))
                                            .padding(.horizontal, 30)
                                            .padding(.vertical, 20)
                                    }
                                }
                                .frame(width: 485)
                                .frame(height: 150)
                                .scrollIndicators(.hidden)
                                
                                Spacer().frame(height: 10)
                                
                                // 부정
                                Text("부정 키워드")
                                
                                ZStack(alignment: .topLeading) {
                                    RoundedRectangle(cornerRadius: 20)
                                        .fill(.gray3)
                                    
                                    ScrollView {
                                        Text((viewModel.dailyReport?.negative_keywords ?? []).joined(separator: ", "))
                                            .padding(.horizontal, 30)
                                            .padding(.vertical, 20)
                                    }
                                }
                                .frame(width: 485)
                                .frame(height: 150)
                                .scrollIndicators(.hidden)
                            }
                            .font(.NanumExtraBold20)
                            .foregroundStyle(.black1)
                        }
                    }
                    .padding(.top, 70) // TODO: 11인치 수정
                    .padding(.bottom, 90) // TODO: 11인치 수정
                    .padding(.horizontal, 70)
                }
                .padding(.horizontal, 97)
                .padding(.bottom, 41)
            }
        }
        .navigationBarBackButtonHidden()
        .task {
            let formatter = DateFormatter()
            formatter.locale = Locale(identifier: "ko_KR")
            formatter.dateFormat = "yyyy-MM-dd"
            let dateString = formatter.string(from: selectedDate)
            
            viewModel.fetchDailyReport(date: dateString)
        }
    }
    
    private var chartGroup: some View {
        let positive = viewModel.dailyReport?.positive_percentage ?? 0
        let negative = viewModel.dailyReport?.negative_percentage ?? 0
        
        let data: [ChartData] = [
            ChartData(emotion: "긍정", value: positive),
            ChartData(emotion: "부정", value: negative)
        ]
        
        return VStack(spacing: 30) {
            Chart(data, id: \.id) { item in
                SectorMark(
                    angle: .value("Emotion", item.value),
                    innerRadius: .ratio(0.618)
                )
                .foregroundStyle(by: .value("Color", item.emotion))
            }
            .frame(width: 370, height: 370)
            .chartForegroundStyleScale([
                "긍정": Color.blue1,
                "부정": Color.red1
            ])
            .chartLegend(.hidden)
            .padding()
            .scaledToFit()
            .shadow(color: .black.opacity(0.25), radius: 4, x: 0, y: 6)
            
            HStack(spacing: 20) {
                Circle()
                    .fill(.blue1)
                    .frame(width: 30)
                
                Text("긍정")
                    .font(.NanumExtraBold20)
                    .foregroundStyle(.black1)
                
                Spacer().frame(width: 30)
                
                Circle()
                    .fill(.red1)
                    .frame(width: 30)
                
                Text("부정")
                    .font(.NanumExtraBold20)
                    .foregroundStyle(.black1)
            }
        }
    }
    
    // MARK: - Function
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko_KR")
        formatter.dateFormat = "yyyy년 M월 dd일 EEEE"
        return formatter
    }()
}

//#Preview {
//    EmotionTodayView()
//        .environment(NavigationRouter<ParentsRoute>())
//}

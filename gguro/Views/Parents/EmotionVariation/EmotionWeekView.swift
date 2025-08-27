//
//  EmotionWeekView.swift
//  gguro
//
//  Created by 김미주 on 8/23/25.
//

import SwiftUI
import Charts
import MarkdownUI

struct WeekChartData: Identifiable {
    let id = UUID()
    let emotion: String
    let value: Double
    let day: String
}

struct EmotionWeekView: View {
    @Environment(NavigationRouter<ParentsRoute>.self) private var router
    @StateObject private var viewModel = EmotionWeekViewModel()

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
                    
                    MessageBox(content: Text("지난 주 감정 분석 리포트"))
                }
                
                ZStack {
                    RoundedRectangle(cornerRadius: 30)
                        .fill(.white.shadow(.inner(color: .shadowWhite, radius: 7)))
                    
                    ScrollView {
                        LazyVStack(spacing: 100) {
                            chartGroup
                            
                            top5Group
                            
                            adviceGroup
                        }
                        .padding(.vertical, 55)
                        .padding(.horizontal, 60)
                    }
                }
                .padding(.horizontal, 97)
                .padding(.bottom, 41)
            }
        }
        .navigationBarBackButtonHidden()
        .task {
            viewModel.fetchAdvice()
        }
    }
    
    // 차트
    private var chartGroup: some View {
        let data: [WeekChartData] = [
            WeekChartData(emotion: "긍정", value: 80, day: "월"),
            WeekChartData(emotion: "부정", value: 20, day: "월"),
            WeekChartData(emotion: "긍정", value: 60, day: "화"),
            WeekChartData(emotion: "부정", value: 40, day: "화"),
            WeekChartData(emotion: "긍정", value: 70, day: "수"),
            WeekChartData(emotion: "부정", value: 30, day: "수"),
            WeekChartData(emotion: "긍정", value: 45, day: "목"),
            WeekChartData(emotion: "부정", value: 55, day: "목"),
            WeekChartData(emotion: "긍정", value: 20, day: "금"),
            WeekChartData(emotion: "부정", value: 80, day: "금"),
            WeekChartData(emotion: "긍정", value: 60, day: "토"),
            WeekChartData(emotion: "부정", value: 40, day: "토"),
            WeekChartData(emotion: "긍정", value: 50, day: "일"),
            WeekChartData(emotion: "부정", value: 50, day: "일")
        ]
        
        let positiveData = data.filter { $0.emotion == "긍정" }
        let negativeData = data.filter { $0.emotion == "부정" }
        
        return VStack(alignment: .leading, spacing: 25) {
            Text("1. 지난 일주일간 00의 긍·부정 반응 비율") // TODO: name
                .font(.PretenardBold36)
                .foregroundStyle(.black1)
                .padding(.bottom, 25)
            
            ZStack {
                HStack(spacing: 40) {
                    // 부정 그래프
                    Chart {
                        ForEach(negativeData) { item in
                            BarMark(
                                x: .value("emotion", -item.value),
                                y: .value("day", item.day),
                                stacking: .unstacked
                            )
                        }
                    }
                    .foregroundStyle(.red1)
                    .chartXAxis(.hidden)
                    .chartYAxis(.hidden)
                    
                    // 긍정 그래프
                    Chart {
                        ForEach(positiveData) { item in
                            BarMark(
                                x: .value("emotion", item.value),
                                y: .value("day", item.day),
                                stacking: .unstacked
                            )
                        }
                    }
                    .foregroundStyle(.blue1)
                    .chartXAxis(.hidden)
                    .chartYAxis(.hidden)
                }
                .padding(.horizontal, 80)
                .frame(height: 383)
                
                // 부정% 요일 긍정%
                VStack(spacing: 32.7) {
                    ForEach(["월","화","수","목","금","토","일"], id: \.self) { day in
                        let pos = positiveData.first(where: { $0.day == day })?.value ?? 0
                        let neg = negativeData.first(where: { $0.day == day })?.value ?? 0
                        
                        HStack(spacing: 20) {
                            Text("\(Int(neg))%")
                                .foregroundStyle(.white)
                                .font(.NanumExtraBold16)
                            Text(day)
                                .foregroundStyle(.black)
                                .font(.NanumExtraBold20)
                            Text("\(Int(pos))%")
                                .foregroundStyle(.white)
                                .font(.NanumExtraBold16)
                        }
                    }
                }
                .frame(height: 383)
            }
            
            HStack(spacing: 20) {
                Spacer()
                
                Circle()
                    .fill(.blue1)
                    .frame(width: 30)
                
                Text("긍정")
                    .font(.NanumExtraBold20)
                    .foregroundStyle(.black1)
                
                Spacer().frame(width: 10)
                
                Circle()
                    .fill(.red1)
                    .frame(width: 30)
                
                Text("부정")
                    .font(.NanumExtraBold20)
                    .foregroundStyle(.black1)
            }
        }
    }
    
    // 긍부정 Top5
    private var top5Group: some View {
        let positiveTop5 = ["삼겹살", "이슬이 누나", "친구", "액션가면", "초코비"]
        let negativeTop5 = ["피망", "나미리 선생님", "병원", "게임", "책"]
        
        let columns = Array(repeating: GridItem(.flexible(), spacing: 18), count: 5)
        
        return VStack(alignment: .leading, spacing: 25) {
            Text("2. 긍정 키워드 Top5")
                .font(.PretenardBold36)
                .foregroundStyle(.black1)
            
            LazyVGrid(columns: columns, spacing: 10) {
                ForEach(positiveTop5.indices, id: \.self) { index in
                    makeTop5(emotion: "p", title: positiveTop5[index])
                }
            }
            
            Spacer().frame(height: 25)
            
            Text("2. 긍정 키워드 Top5")
                .font(.PretenardBold36)
                .foregroundStyle(.black1)
            
            LazyVGrid(columns: columns, spacing: 10) {
                ForEach(negativeTop5.indices, id: \.self) { index in
                    makeTop5(emotion: "n", title: negativeTop5[index])
                }
            }
        }
    }
    
    // 관계 개선 포인트
    private var adviceGroup: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("4. 관계 개선 포인트 및 요약 메시지")
                .font(.PretenardBold36)
                .foregroundStyle(.black1)
                .padding(.bottom, 25)
            
            Markdown(viewModel.advice)
                .markdownTheme(.advice)
        }
    }
    
    // MARK: - Function
    private func makeTop5(emotion: String, title: String) -> some View {
        let shadow = emotion == "p" ? Color.shadowBlue : Color.shadowRed
        
        return ZStack {
            RoundedRectangle(cornerRadius: 25)
                .fill(.white.shadow(.inner(color: shadow, radius: 7)))
            
            Text(title)
                .font(.NanumExtraBold24)
                .foregroundStyle(.black1)
        }
        .frame(height: 95)
    }
}

#Preview {
    EmotionWeekView()
        .environment(NavigationRouter<ParentsRoute>())
}

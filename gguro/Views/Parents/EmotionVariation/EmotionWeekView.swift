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
    @State private var viewModel = EmotionVariationViewModel()
    
    let adviceText = """
  ## 💎 관계 개선 포인트

  ### 긍정 키워드 분석

    **강아지**: 아이가 강아지를 좋아하는 것은 그들의 사회적 본능을 반영합니다. 강아지는 많은 사람에게 사랑과 따뜻함을 상징하며, 아이는 이러한  감정을 받고 싶어 합니다. 부모는 이 기회를 활용하여 아이와 함께 강아지를 돌보거나, 가상의 상황에서 강아지와의 놀이를 시뮬레이션하는 대화를 통해 아이가 사회적 사랑과 따뜻함을 느끼게 할 수 있습니다.

    **선물**: 아이가 선물을 받는 것을 좋아하는 것은 그들의 성취감을 증진시키는 중요한 요소입니다. 부모는 아이의 관심사에 맞춘 작은 선물을 주거나, 아이가 직접 선물을 준비할 수 있도록 도와주어 자존감을 높일 수 있습니다.

  ### 부정 키워드 분석

    **병원**: 병원이 부정적인 감정을 유발하는 이유 중 하나는 그곳에서 경험한 불안과 두려움 때문입니다. 아이는 병원을 통해 부모가 자신의 건강을 돌보지 않는다고 느끼거나, 병원에서의 경험에서 받은 스트레스를 기억하고 있습니다. 부모는 이러한 부정적 감정을 긍정적인 경험으로 전환하기 위해, 아이와 함께 병원의 좋은 면을 이야기하거나, 건강한 생활 습관을 유지하는 데 도움을 주는 대화를 시도해 보세요.

    **피망**: 피망과 같은 특정 장난감이나 물건에 대한 부정 반응은 아이가 그 물건이 자신에게 어떤 의미를 가질지 모르는 경우가 많습니다. 부노는 이 기회를 활용하여 아이와 함께 그 물건의 좋은 점을 이야기하고, 아이가 자신의 감정을 표현할 수 있는 안전한 공간을 제공하세요.

  ## 📝 주간 요약 및 격려 메시지

  지난 일주일 동안 아이는 긍정적인 경험을 많이 했으며, 특히 강아지와 선물에 대한 관심이 두드러졌습니다. 이러한 반응은 아이가 사회적 사랑과 성취감을 느끼고자 하는 본능을 보여줍니다. 부모는 이 기회를 활용하여 아이의 긍정적인 면을 더욱 키워주고, 부정적인 경험에서도 긍정적인 측면을 찾아내어 함께 해결해 나갈 수 있습니다.

  이번주에는 더 많은 긍정적인 경험을 쌓아가며, 부정적 감정을 긍정적으로 전환하는 데 도움을 줄 수 있도록 노력해 보세요. 아이의 마음을 이해하고 응원하며, 그들의 성장을 함께 만들어가는 것이 중요합니다.
  """

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
            
            Markdown(adviceText)
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

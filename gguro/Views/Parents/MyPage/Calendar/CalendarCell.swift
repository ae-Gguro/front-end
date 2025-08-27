//
//  CalendarCell.swift
//  gguro
//
//  Created by 김미주 on 8/23/25.
//

import SwiftUI

struct CalendarCell: View {
    @Environment(NavigationRouter<MypageRoute>.self) private var router
    
    var calendarDay: CalendarDay
    var isSelected: Bool
    @Bindable var viewModel: ReportCalendarViewModel
    
    var body: some View {
        ZStack {
            let status = viewModel.status(for: calendarDay.date)
            if status == "positive" {
                Circle()
                    .fill(Color.blue1)
                    .frame(width: 35, height: 35)
                    .transition(.scale.combined(with: .opacity))
            } else if status == "negative" {
                Circle()
                    .fill(Color.red1)
                    .frame(width: 35, height: 35)
                    .transition(.scale.combined(with: .opacity))
            } else if status == "neutral" {
                Circle()
                    .fill(Color.gray1)
                    .frame(width: 35, height: 35)
                    .transition(.scale.combined(with: .opacity))
            }
                
            Text("\(calendarDay.day)")
                .font(.NanumExtraBold20)
                .foregroundStyle(textColor)
                .animation(.easeInOut(duration: 0.2), value: viewModel.selectedDate)
        }
        .frame(height: 30)
        .onTapGesture {
            withAnimation(.spring(response: 0.4, dampingFraction: 0.5, blendDuration: 0)) {
                viewModel.changeSelectedDate(calendarDay.date)
                router.push(.emotionToday(date: viewModel.selectedDate))
            }
        }
    }
    
    private var textColor: Color {
        let status = viewModel.status(for: calendarDay.date)
        
       if !calendarDay.isCurrentMonth {
           return .gray1
       } else if status != "none"  {
           return .white
       } else {
           return .black1
       }
    }
}

//#Preview {
//    CalendarCell()
//}

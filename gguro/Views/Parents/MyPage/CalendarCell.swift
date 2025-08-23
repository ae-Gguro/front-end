//
//  CalendarCell.swift
//  gguro
//
//  Created by 김미주 on 8/23/25.
//

import SwiftUI

struct CalendarCell: View {
    var calendarDay: CalendarDay
    var isSelected: Bool
    @Bindable var viewModel: ReportCalendarViewModel
    
    var body: some View {
        ZStack {
            if isSelected {
                // TODO: 선택 날짜 표시
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
            }
        }
    }
    
    private var textColor: Color {
       if calendarDay.isCurrentMonth {
           return .black1
        } else {
            return .gray1
        }
    }
}

//#Preview {
//    CalendarCell()
//}

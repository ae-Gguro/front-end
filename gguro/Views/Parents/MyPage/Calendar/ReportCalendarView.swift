//
//  ReportCalendarView.swift
//  gguro
//
//  Created by 김미주 on 8/23/25.
//

import SwiftUI

struct ReportCalendarView: View {
    @State private var viewModel = ReportCalendarViewModel()
    
    var body: some View {
        VStack(spacing: 30) {
            headerController
            calendarView
        }
        .padding(.horizontal, 30)
        .task {
            viewModel.fetchSummaryMonth(year: viewModel.currentYear, month: viewModel.currentMonthNumber)
        }
    }
    
    // 월 변경
    private var headerController: some View {
        HStack(spacing: 30) {
            Button(action: {
                viewModel.changeMonth(by: -1)
            }) {
                Image(systemName: "chevron.left")
                    .foregroundStyle(.black1)
            }
            
            Text(viewModel.currentMonth, formatter: calendarHeaderDateFormatter)
                .font(.NanumExtraBold20)
                .foregroundStyle(.black1)
            
            Button(action: {
                viewModel.changeMonth(by: 1)
            }) {
                Image(systemName: "chevron.right")
                    .foregroundStyle(.black1)
            }
        }
    }
    
    // 헤더 날짜 포맷
    let calendarHeaderDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy년 M월"
        return formatter
    }()
    
    // 달력
    private var calendarView: some View {
        LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 0), count: 7), spacing: 10, content: {
            ForEach(localizedWeekdaySymbols.indices, id: \.self) { index in
                Text(localizedWeekdaySymbols[index])
                    .foregroundStyle(index == 0 ? .red1 : index == 6 ? .blue1 : .black1)
                    .frame(maxWidth: .infinity)
                    .font(.NanumExtraBold20)
            }
            .padding(.bottom, 15)
            
            ForEach(viewModel.daysForCurrentGrid(), id: \.id) { calendarDay in
                let isSelectedDate = viewModel.calendar.isDate(calendarDay.date, inSameDayAs: viewModel.selectedDate)
                CalendarCell(calendarDay: calendarDay, isSelected: isSelectedDate, viewModel: viewModel)
            }
        })
        .frame(height: 310, alignment: .top)
    }
    
    // 한글 요일
    let localizedWeekdaySymbols: [String] = {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko_KR")
        return formatter.shortWeekdaySymbols ?? []
    }()
}

#Preview {
    ReportCalendarView()
}

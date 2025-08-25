//
//  ReportCalendarViewModel.swift
//  gguro
//
//  Created by 김미주 on 8/23/25.
//

import Foundation
import SwiftUI
import Moya

@Observable
class ReportCalendarViewModel {
    var currentMonth: Date
    var selectedDate: Date
    var calendar: Calendar
    
    var currentMonthYear: Int {
        Calendar.current.component(.year, from: currentMonth)
    }
    
    init(currentMonth: Date = Date(), selectedDate: Date = Date(), calendar: Calendar = Calendar.current) {
        self.currentMonth = currentMonth
        self.selectedDate = selectedDate
        self.calendar = calendar
    }
    
    // 월 변경
    func changeMonth(by value: Int) {
        let calendar = Calendar.current
        if let newMonth = calendar.date(byAdding: .month, value: value, to: currentMonth) {
            currentMonth = newMonth
        }
    }
    
    // CalendarDay 배열 생성
    func daysForCurrentGrid() -> [CalendarDay] {
        let calendar = Calendar.current
        
        // 현재 월 정보
        let firstDay = firstDayOfMonth()
        let firstWeekDay = calendar.component(.weekday, from: firstDay)
        let daysInMonth = numberOfDays(in: currentMonth)
        
        var days: [CalendarDay] = []
        
        // 이전달 셀 개수
        let leadingDays = (firstWeekDay - calendar.firstWeekday + 7) % 7
        
        // 이전 달 회색으로 생성
        if leadingDays > 0, let previousMonth = calendar.date(byAdding: .month, value: -1, to: currentMonth) {
            let daysInPreviousMonth = numberOfDays(in: previousMonth)
            for i in 0..<leadingDays {
                let day = daysInPreviousMonth - leadingDays + i + 1
                if let date = calendar.date(bySetting: .day, value: day, of: previousMonth) {
                    days.append(CalendarDay(day: day, date: date, isCurrentMonth: false))
                }
            }
        }
        
        for day in 1...daysInMonth {
            var components = calendar.dateComponents([.year, .month], from: currentMonth)
            components.day = day
            components.hour = 0
            components.minute = 0
            components.second = 0
            
            if let date = calendar.date(from: components) {
                days.append(CalendarDay(day: day, date: date, isCurrentMonth: true))
            }
        }
        
        let remaining = (7 - days.count % 7) % 7
        if remaining > 0,
           let nextMonth = calendar.date(byAdding: .month, value: 1, to: currentMonth) {
            let daysInNextMonth = numberOfDays(in: nextMonth)
            
            for day in 1...remaining {
                let validDay = min(day, daysInNextMonth)
                if let date = calendar.date(bySetting: .day, value: validDay, of: nextMonth) {
                    days.append(CalendarDay(day: validDay, date: date, isCurrentMonth: false))
                }
            }
        }
        
        return days
    }
    
    // 현재 달의 1일 날짜
    func firstDayOfMonth() -> Date {
        let components = Calendar.current.dateComponents([.year, .month], from: currentMonth)
        return Calendar.current.date(from: components) ?? Date()
    }
    
    // 총 일 수
    func numberOfDays(in date: Date) -> Int {
        Calendar.current.range(of: .day, in: .month, for: date)?.count ?? 0
    }
    
    // date가 속한 달의 첫 번째 요일
    private func firstWeekdayOfMonth(in date: Date) -> Int {
        let components = Calendar.current.dateComponents([.year, .month], from: date)
        let firstDay = Calendar.current.date(from: components)!
        return Calendar.current.component(.weekday, from: firstDay)
    }
    
    // 선택한 날짜 업데이트
    public func changeSelectedDate(_ date: Date) {
        if calendar.isDate(selectedDate, inSameDayAs: date) {
            return
        } else {
            selectedDate = date
        }
    }
}

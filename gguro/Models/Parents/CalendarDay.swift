//
//  CalendarDay.swift
//  gguro
//
//  Created by 김미주 on 8/23/25.
//

import Foundation

struct CalendarDay: Identifiable {
    var id: UUID = .init()
    let day: Int
    let date: Date
    let isCurrentMonth: Bool
}

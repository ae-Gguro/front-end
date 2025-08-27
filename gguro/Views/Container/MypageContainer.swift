//
//  MypageContainer.swift
//  gguro
//
//  Created by 김미주 on 8/23/25.
//

import SwiftUI

struct MypageContainer: View {
    @State private var router = NavigationRouter<MypageRoute>()
    @State private var pRouter = NavigationRouter<ParentsRoute>()
    
    var body: some View {
        NavigationStack(path: $router.path) {
            MyPageView()
                .navigationDestination(for: MypageRoute.self) { route in
                    switch route {
                    case .mypage:
                        MyPageView()
                        
                    case .emotionToday(let date):
                        EmotionTodayView(selectedDate: date)
                    case .emotionWeek:
                        EmotionWeekView()
                        
                    case .conversation:
                        ConversationDataView()
                            .environment(pRouter)
                        
                    case .setting:
                        SettingView()
                    case .edit:
                        ProfileEditView()
                    }
                }
        }
        .environment(router)
    }
}

#Preview {
    MypageContainer()
}

//
//  MypageContainer.swift
//  gguro
//
//  Created by 김미주 on 8/23/25.
//

import SwiftUI

struct MypageContainer: View {
    @State private var router = NavigationRouter<MypageRoute>()
    
    var body: some View {
        NavigationStack(path: $router.path) {
            MyPageView()
                .navigationDestination(for: MypageRoute.self) { route in
                    switch route {
                    case .mypage:
                        MyPageView()
                        
                    case .emotionToday:
                        EmotionTodayView()
                    case .emotionWeek:
                        EmotionWeekView()
                        
                    case .conversation:
                        ConversationDataView()
                        
                    case .setting:
                        SettingView()
                    }
                }
        }
        .environment(router)
    }
}

#Preview {
    MypageContainer()
}

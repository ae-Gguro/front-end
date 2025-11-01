//
//  MypageContainer.swift
//  gguro
//
//  Created by 김미주 on 8/23/25.
//

import SwiftUI

struct MypageContainer: View {
    @State private var router = NavigationRouter<MypageRoute>()
    @State private var paRouter = NavigationRouter<ParentsRoute>()
    @StateObject private var profileViewModel = ProfileSelectViewModel()
    
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
                        
                    case .setting:
                        SettingView()
                    case .edit:
                        ProfileEditView()
                        
                    case .profileSelect:
                        ProfileSelectView(type: .onboarding)
                    case .profileCreate:
                        ProfileCreateView(type: .onboarding)
                    }
                }
        }
        .environment(router)
        .environment(paRouter)
        .environmentObject(profileViewModel)
        .task {
            let hasProfile = UserDefaults.standard.string(forKey: "profileId") != nil
            if !hasProfile {
                DispatchQueue.main.async {
                    router.push(.profileSelect)
                }
            }
        }
    }
}

#Preview {
    MypageContainer()
}

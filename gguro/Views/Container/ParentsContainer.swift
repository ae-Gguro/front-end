//
//  ParentsContainer.swift
//  gguro
//
//  Created by 김미주 on 8/23/25.
//

import SwiftUI

struct ParentsContainer: View {
    @State private var router = NavigationRouter<ParentsRoute>()
    
    @StateObject private var conversationDataViewModel = ConversationDataViewModel()
    @StateObject private var parentsViewModel = ParentsViewModel()
    
    var body: some View {
        NavigationStack(path: $router.path) {
            ParentsMainView()
                .navigationDestination(for: ParentsRoute.self) { route in
                    switch route {
                    case .main:
                        ParentsMainView()
                        
                    case .conversationData:
                        ConversationDataView()
                    case .conversationDetail:
                        ConversationDetailView()
                    case .emotionVariation:
                        EmotionVariationView()
                    }
                }
                .task {
                    parentsViewModel.fetchChildName()
                }
        }
        .environment(router)
        .environmentObject(conversationDataViewModel)
        .environment(\.childName, parentsViewModel.name)
    }
}

#Preview {
    ParentsContainer()
}

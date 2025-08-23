//
//  ParentsContainer.swift
//  gguro
//
//  Created by 김미주 on 8/23/25.
//

import SwiftUI

struct ParentsContainer: View {
    @State private var router = NavigationRouter<ParentsRoute>()
    
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
        }
        .environment(router)
    }
}

#Preview {
    ParentsContainer()
}

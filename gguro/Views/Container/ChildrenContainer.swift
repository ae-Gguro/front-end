//
//  ChildrenContainer.swift
//  gguro
//
//  Created by 김미주 on 8/27/25.
//

import SwiftUI

struct ChildrenContainer: View {
    @State private var router = NavigationRouter<ChildrenRoute>()
    
    var body: some View {
        NavigationStack(path: $router.path) {
            ChildrenMainView()
                .navigationDestination(for: ChildrenRoute.self) { route in
                    switch route {
                    case .main:
                        ChildrenMainView()
                        
                    case .talk:
                        AIChatScreen()
                        
                    case .play:
                        ChildrenPlayingMenu()
                    case .quiz:
                        WordQuizScreen()
                    case .role:
                        RolePlayScreen()
                        
                    case .study:
                        EmptyView()
                    case .life:
                        EmptyView()
                    case .animal:
                        EmptyView()
                    }
                }
        }
        .environment(router)
    }
}

#Preview {
    ChildrenContainer()
}

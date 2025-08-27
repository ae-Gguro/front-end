//
//  ChildrenContainer.swift
//  gguro
//
//  Created by 김미주 on 8/27/25.
//

import SwiftUI

struct ChildrenContainer: View {
    @State private var router = NavigationRouter<ChildrenRoute>()
    @StateObject private var childrenViewModel = ChildrenViewModel()
    @StateObject private var parentsViewModel = ParentsViewModel()
    
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
                        ChildrenStudyingMenu()
                    case .lifeMenu:
                        LifeStudyListView()
                    case .life:
                        LifeStudyScreen()
                    case .animalMenu:
                        AnimalStudyListView()
                    case .animal:
                        AnimalStudyScreen()
                    }
                }
                .task {
                    parentsViewModel.fetchChildName()
                    childrenViewModel.fetchChildNamePossessive()
                    childrenViewModel.fetchChildNameNominative()
                }
        }
        .environment(router)
        .environment(\.childName, parentsViewModel.name)
        .environment(\.childNameAYA, childrenViewModel.ayaName)
        .environment(\.childNameIGA, childrenViewModel.igaName)
    }
}

#Preview {
    ChildrenContainer()
}

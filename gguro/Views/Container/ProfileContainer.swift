//
//  ProfileContainer.swift
//  gguro
//
//  Created by 김미주 on 8/23/25.
//

import SwiftUI

struct ProfileContainer: View {
    @State private var router = NavigationRouter<ProfileRoute>()
    
    var body: some View {
        NavigationStack(path: $router.path) {
            ProfileSelectView(type: .onboarding)
                .navigationDestination(for: ProfileRoute.self) { route in
                    switch route {
                    case .profileSelect:
                        ProfileSelectView(type: .onboarding)
                    case .profileCreate:
                        ProfileCreateView(type: .onboarding)
                    }
                }
        }
        .environment(router)
    }
}

#Preview {
    ProfileContainer()
}

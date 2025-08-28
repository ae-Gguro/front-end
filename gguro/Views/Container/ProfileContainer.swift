//
//  ProfileContainer.swift
//  gguro
//
//  Created by 김미주 on 8/23/25.
//

import SwiftUI

struct ProfileContainer: View {
    @State private var router = NavigationRouter<ProfileRoute>()
    @State private var pRouter = NavigationRouter<ParentsRoute>()
    
    @StateObject private var profileViewModel = ProfileSelectViewModel()
    
    let type: ProfileCreateType
    
    var body: some View {
        NavigationStack(path: $router.path) {
            ProfileSelectView(type: type)
                .navigationDestination(for: ProfileRoute.self) { route in
                    switch route {
                    case .profileSelect:
                        ProfileSelectView(type: type)
                    case .profileCreate:
                        ProfileCreateView(type: type)
                    }
                }
        }
        .environment(router)
        .environment(pRouter)
        .environmentObject(profileViewModel)
    }
}

#Preview {
    ProfileContainer(type: .onboarding)
}

//
//  RoleplayContentView.swift
//  gguro
//
//  Created by 이채은 on 7/15/25.
//

import SwiftUI


struct RoleplayContentView: View {
    let state: RoleplayState
    
    var body: some View {
        switch state {
        case .intro:
            RoleplayIntroView()
        case .confirm:
            RoleplayConfirmView()
        case .started:
            RoleplayStartView()
        case .listening:
            ListeningView()
        case .thinking:
            ThinkingView()
        case .ended:
            RoleplayEndedView()
        }
    }
}

struct RolePlayScreen: View {
    @Environment(\.childNameAYA) private var childName
    
    var body: some View {
        BlackBoardLayout(type: .wordQuiz(name: childName)) {
            RoleplayContentView(state: .intro(name: childName))
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview{
    RolePlayScreen()
}

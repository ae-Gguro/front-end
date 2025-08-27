//
//  ConversationContentView.swift
//  gguro
//
//  Created by 이채은 on 7/14/25.
//

import SwiftUI

struct ConversationContentView: View {
    let state: AIChatState
    
    var body: some View {
        switch state {
        case .intro:
            ConversationIntroView()
        case .listening:
            ListeningView()
        case .thinking:
            ThinkingView()
        case .ended:
            ConversationEndedView()
        }
    }
}

struct AIChatScreen: View {
    @Environment(\.childNameAYA) private var childName

    var body: some View {
        BlackBoardLayout(type: .aiChat(name: childName)) {
            ConversationContentView(state: .ended)
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    AIChatScreen()
}

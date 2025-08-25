//
//  ConversationContentView.swift
//  gguro
//
//  Created by 이채은 on 7/14/25.
//

import SwiftUI

struct ConversationContentView: View {
    let state: AIChatState
    let name: String
    
    var body: some View {
        switch state {
        case .intro:
            ConversationIntroView(name: name)
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
    var body: some View {
        BlackBoardLayout(type: .aiChat(name: "은서")) {
            ConversationContentView(state: .listening, name: "은서")
        }
    }
}

#Preview {
    AIChatScreen()
}

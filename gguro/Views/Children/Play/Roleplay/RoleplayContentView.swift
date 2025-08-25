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
        case .intro(let name):
            RoleplayIntroView(name: name)
        case .confirm(let name):
            RoleplayConfirmView(name: name)
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

#Preview{
    BlackBoardLayout(type: .rolePlay(name: "은서")) {
        RoleplayContentView(state: .ended)
    }
}

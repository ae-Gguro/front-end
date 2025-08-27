//
//  LifeStudyContentView.swift
//  gguro
//
//  Created by 이채은 on 7/15/25.
//

import SwiftUI

struct LifeStudyContentView: View {
    @Environment(\.childNameAYA) private var childName
    
    let state: LifeStudyState
    
    var body: some View {
        
        switch state {
        case .intro:
            LifeStudyIntroView()
        case .question:
            LifeStudyIntroView()
        case .wrongAnswer:
            LifeStudyIntroView()
        case .correctAnswer:
            LifeStudyIntroView()
        case .listening:
            ListeningView()
        case .thinking:
            ThinkingView()
            
        }
    }
}

struct LifeStudyScreen: View {
    @Environment(\.childNameAYA) private var childName
    
    var body: some View {
        BlackBoardLayout(type: .lifeStudy(name: childName)) {
            LifeStudyContentView(state: .intro(name: childName))
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview{
    LifeStudyScreen()
}

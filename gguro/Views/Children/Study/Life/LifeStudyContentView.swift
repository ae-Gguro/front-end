//
//  LifeStudyContentView.swift
//  gguro
//
//  Created by 이채은 on 7/15/25.
//

import SwiftUI

struct LifeStudyContentView: View {
    let state: LifeStudyState
    
    var body: some View {
        
        switch state {
        case .intro(let name):
            LifeStudyIntroView(name: name)
        case .question(let name):
            LifeStudyIntroView(name: name)
        case .wrongAnswer(let name):
            LifeStudyIntroView(name: name)
        case .correctAnswer(let name):
            LifeStudyIntroView(name: name)
        case .listening:
            ListeningView()
        case .thinking:
            ThinkingView()
            
        }
    }
}

struct LifeStudyScreen: View {
    var body: some View {
        BlackBoardLayout(type: .lifeStudy(name: "은서")) {
            LifeStudyContentView(state: .intro(name: "은서"))
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview{
    BlackBoardLayout(type: .lifeStudy(name: "은서")) {
        LifeStudyContentView(state: .intro(name: "은서"))
    }
}

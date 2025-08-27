//
//  AnimalStudyContentView.swift
//  gguro
//
//  Created by 이채은 on 7/15/25.
//

import SwiftUI

struct AnimalStudyContentView: View {
    let state: AnimalStudyState
    
    var body: some View {
        
        switch state {
        case .intro:
            AnimalStudyIntroView()
        case .question:
            AnimalStudyIntroView()
        case .wrongAnswer:
            AnimalStudyIntroView()
        case .correctAnswer:
            AnimalStudyIntroView()
        case .listening:
            ListeningView()
        case .thinking:
            ThinkingView()
            
        }
    }
}

struct AnimalStudyScreen: View {
    @Environment(\.childNameAYA) private var childName
    
    var body: some View {
        BlackBoardLayout(type: .animalStudy(name: childName)) {
            AnimalStudyContentView(state: .intro(name: childName))
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview{
    AnimalStudyScreen()
}

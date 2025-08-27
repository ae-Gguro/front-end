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
        case .intro(let name):
            AnimalStudyIntroView(name: name)
        case .question(let name):
            AnimalStudyIntroView(name: name)
        case .wrongAnswer(let name):
            AnimalStudyIntroView(name: name)
        case .correctAnswer(let name):
            AnimalStudyIntroView(name: name)
        case .listening:
            ListeningView()
        case .thinking:
            ThinkingView()
            
        }
    }
}



#Preview{
    BlackBoardLayout(type: .animalStudy(name: "은서")) {
        AnimalStudyContentView(state: .intro(name: "은서"))
    }
}

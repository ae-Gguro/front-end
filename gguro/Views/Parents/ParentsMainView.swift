//
//  ParentsMainView.swift
//  gguro
//
//  Created by 김미주 on 6/4/25.
//

import SwiftUI

struct ParentsMainView: View {
    @EnvironmentObject private var viewModel: ConversationDataViewModel
    
    var body: some View {
        ZStack {
            BackgroundImage()
            
            VStack {
                ParentsHeaderView()
                
                Spacer().frame(height: 125)
                
                HStack(spacing: 116) {
                    ParentsMenu(type: .conversation(name: viewModel.name))
                    ParentsMenu(type: .emotion(name: viewModel.name))
                }
                
                Spacer()
            }
        }
    }
}

#Preview {
    ParentsMainView()
}

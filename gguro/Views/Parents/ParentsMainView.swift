//
//  ParentsMainView.swift
//  gguro
//
//  Created by 김미주 on 6/4/25.
//

import SwiftUI

struct ParentsMainView: View {
    @Environment(\.childName) private var childName
    
    var body: some View {
        ZStack {
            BackgroundImage()
            
            VStack {
                ParentsHeaderView()
                
                Spacer().frame(height: 125)
                
                HStack(spacing: 116) {
                    ParentsMenu(type: .conversation(name: childName))
                    ParentsMenu(type: .emotion(name: childName))
                }
                
                Spacer()
            }
        }
    }
}

#Preview {
    ParentsMainView()
}

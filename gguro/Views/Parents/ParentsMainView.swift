//
//  ParentsMainView.swift
//  gguro
//
//  Created by 김미주 on 6/4/25.
//

import SwiftUI

struct ParentsMainView: View {
    var body: some View {
        ZStack {
            BackgroundImage()
            
            VStack {
                Spacer().frame(height: 30)
                
                ParentsHeaderView()
                
                Spacer().frame(height: 125)
                
                HStack(spacing: 116) {
                    ParentsMenu(type: .conversation(name: "은서"))
                    ParentsMenu(type: .emotion(name: "은서"))
                }
                
                Spacer()
            }
        }
    }
}

#Preview {
    ParentsMainView()
}

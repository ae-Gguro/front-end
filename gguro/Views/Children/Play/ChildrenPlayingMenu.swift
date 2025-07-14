//
//  ChildrenPlayingMenu.swift
//  gguro
//
//  Created by 이채은 on 7/14/25.
//

import SwiftUI

struct ChildrenPlayingMenu: View {
    var name: String = "은서"
    
    var body: some View {
        ZStack {
            BackgroundImage()
            
            VStack {
                ChildrenHeaderView()
                    .padding(.top, 30)
                
                Spacer().frame(height: 24)
                
                MessageBox(content: Text("\(name)(이)가 하고 싶은 걸 선택해봐! 🎶"))
                
                Spacer().frame(height: 31)
                
                HStack(spacing: 130) {
                    ChildrenMenu(type: .quiz)
                    ChildrenMenu(type: .roleplay)
                }
                
                Spacer()
            }
        }
    }
}

#Preview {
  ChildrenPlayingMenu()
}

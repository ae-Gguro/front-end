//
//  ChildrenStudyingMenu.swift
//  gguro
//
//  Created by 이채은 on 7/15/25.
//

import SwiftUI

struct ChildrenStudyingMenu: View {
    var name: String = "은서"
    
    var body: some View {
        ZStack {
            BackgroundImage()
            
            VStack {
                ChildrenHeaderView()
                    .padding(.top, 30)
                
                Spacer().frame(height: 24)
                
                MessageBox(content: Text("\(name)야! 어떤 주제를 공부해볼까?✏️"))
                
                Spacer().frame(height: 31)
                
                HStack(spacing: 130) {
                    ChildrenMenu(type: .lifeStudy)
                    ChildrenMenu(type: .animalStudy)
                }
                
                Spacer()
            }
        }
    }
}
import SwiftUI



#Preview {
    ChildrenStudyingMenu()
}

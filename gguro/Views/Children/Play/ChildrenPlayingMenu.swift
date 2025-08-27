//
//  ChildrenPlayingMenu.swift
//  gguro
//
//  Created by 이채은 on 7/14/25.
//

import SwiftUI

struct ChildrenPlayingMenu: View {
    @Environment(NavigationRouter<ChildrenRoute>.self) private var router
    @Environment(\.childNameIGA) private var childName
    
    var body: some View {
        ZStack {
            BackgroundImage()
            
            VStack {
                ChildrenHeaderView()
                    .padding(.top, 30)
                
                Spacer().frame(height: 24)
                
                // 상단 메뉴
                ZStack {
                    HStack {
                        BackButton(color: "red")
                        Spacer()
                    }
                    .padding(.horizontal, 45)
                    
                    MessageBox(content: Text("\(childName) 하고 싶은 걸 선택해봐! 🎶"))
                }
                
                Spacer().frame(height: 31)
                
                HStack(spacing: 130) {
                    ChildrenMenu(type: .quiz, action: { router.push(.quiz) })
                    ChildrenMenu(type: .roleplay, action: { router.push(.role)} )
                }
                
                Spacer()
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
  ChildrenPlayingMenu()
}

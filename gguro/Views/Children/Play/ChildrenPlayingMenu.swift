//
//  ChildrenPlayingMenu.swift
//  gguro
//
//  Created by 이채은 on 7/14/25.
//

import SwiftUI

struct ChildrenPlayingMenu: View {
    @Environment(NavigationRouter<ChildrenRoute>.self) private var router

    var name: String = "은서"
    
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
                    
                    MessageBox(content: Text("\(name)(이)가 하고 싶은 걸 선택해봐! 🎶"))
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

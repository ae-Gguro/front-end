//
//  ChildrenMainView.swift
//  gguro
//
//  Created by 김미주 on 6/4/25.
//

import SwiftUI

struct ChildrenMainView: View {
    @Environment(NavigationRouter<ChildrenRoute>.self) private var router
    
    var body: some View {
        ZStack {
            BackgroundImage()
            
            VStack {
                Spacer().frame(height: 30)
                
                ChildrenHeaderView()
                
                Spacer().frame(height: 126)
                
                ChildrenMenuButtonGroup
                
                Spacer()
            }
        }
        .navigationBarBackButtonHidden()
    }
    
    private var ChildrenMenuButtonGroup: some View {
        HStack(spacing: 75) {
            ChildrenMenu(type: .conversation, action: {
                print("[DEBUG] 대화 버튼 눌림")   // ✅ 여기가 찍히는지 확인
                router.push(.talk)
            })
            ChildrenMenu(type: .playing, action: { router.push(.play) })
            ChildrenMenu(type: .studying, action: { router.push(.study) })
        }
    }

}

#Preview {
    ChildrenMainView()
}

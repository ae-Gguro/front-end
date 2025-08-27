//
//  ChildrenMainView.swift
//  gguro
//
//  Created by 김미주 on 6/4/25.
//

import SwiftUI

struct ChildrenMainView: View {
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
            ChildrenMenu(type: .conversation)
            ChildrenMenu(type: .playing)
            ChildrenMenu(type: .studying)
        }
    }
}

#Preview {
    ChildrenMainView()
}

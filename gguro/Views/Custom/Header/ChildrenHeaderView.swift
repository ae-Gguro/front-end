//
//  ChildrenHeaderView.swift
//  gguro
//
//  Created by 이채은 on 7/13/25.
//

import SwiftUI

struct ChildrenHeaderView: View {
    var body: some View {
        
        HStack(spacing: 20) {
            ProfileGroup
            
            Spacer()
            
            ButtonGroup
        }
        .padding(.horizontal, 35)
        .padding(.top, 0)
        
    }
    
    private var ProfileGroup: some View {
        HStack(spacing: 25) {
            HeaderChildProfile(color: .red, name: "은서", isEnabled: true)
            HeaderChildProfile(color: .blue, name: "채은", isEnabled: false)
            HeaderChildProfile(color: .green, name: "민지", isEnabled: false)
            HeaderChildProfile(color: .purple, name: "미주", isEnabled: false)
        }
    }
    
    private var ButtonGroup: some View {
        HStack(spacing: 20){
            HeaderMenu(type: .parents)
            HeaderMenu(type: .home)
        }
    }
}

#Preview {
    ChildrenHeaderView()
}

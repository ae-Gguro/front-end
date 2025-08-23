//
//  ParentsMenu.swift
//  gguro
//
//  Created by 김미주 on 7/9/25.
//

import SwiftUI

struct ParentsMenu: View {
    @Environment(NavigationRouter<ParentsRoute>.self) private var router
    
    let type: ParentsMenuType
    
    var body: some View {
        Button(action: {
            switch type {
            case .conversation:
                router.push(.conversationData)
            case .emotion:
                router.push(.emotionVariation)
            }
        }) {
            VStack(spacing: 40) {
                ZStack {
                    RoundedRectangle(cornerRadius: 25)
                        .fill(.white.shadow(.inner(color: .shadowWhite, radius: 7)))
                        .frame(width: 500, height: 500)
                    
                    VStack(spacing: 30) {
                        type.title
                            .font(.NanumExtraBold45)
                            .foregroundStyle(.black2)
                        
                        type.icon
                            .resizable()
                            .frame(width: 250, height: 250)
                    }
                }
                
                
                ZStack {
                    RoundedRectangle(cornerRadius: 25)
                        .fill(.blue1.shadow(.inner(color: .shadowBlue, radius: 7)))
                        .frame(width: 500, height: 100)
                    
                    Text(type.buttonTitle)
                        .font(.NanumExtraBold36)
                        .foregroundStyle(.white)
                }
            }
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    ParentsMenu(type: .conversation(name: "은서"))
}

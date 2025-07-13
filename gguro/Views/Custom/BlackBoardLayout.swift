//
//  BlackBoardLayout.swift
//  gguro
//
//  Created by 이채은 on 7/14/25.
//

import SwiftUI

struct BlackBoardLayout<Content: View>: View {
    let type: ChildrenAIType
    let content: () -> Content
    
    var body: some View {
        ZStack {
            BackgroundImage()
            
            VStack {
                Spacer().frame(height: 30)
                
                ChildrenHeaderView()
                
                Spacer().frame(height: 24)
                
                HStack {
                    BackButton(color: "red")
                        .padding(.leading, 45)
                    Spacer().frame(width: 198)
                    type.messageBox
                    Spacer()
                }
                
                Spacer().frame(height: 50)
                
                ZStack {
                    Image(.imageBlackboard)
                        .resizable()
                        .frame(width: 1277, height: 654)
                    
                    content()
                }
                
                
                
                Spacer()
                
            }
        }
    }
}

#Preview {
    BlackBoardLayout(type: .aiChat(name: "은서")) {
        Text("하이")
    }
}

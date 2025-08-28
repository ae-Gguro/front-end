//
//  ChildrenMenu.swift
//  gguro
//
//  Created by 이채은 on 7/13/25.
//

import SwiftUI

struct ChildrenMenu: View {
    let type: ChildrenMenuType
    let action: () -> Void
    
    var body: some View {
        Button(action: {
            print("[DEBUG] ChildrenMenu tapped: \(type)")
            action()
        }) {
            VStack(spacing: 40) {
                ZStack {
                    RoundedRectangle(cornerRadius: 25)
                        .fill(.white.shadow(.inner(color: .shadowWhite, radius: 7)))
                        .frame(width: 350, height: 500)
                    
                    Image(.imageMenuBackground)
                    
                    VStack(spacing: 34) {
                        Spacer().frame(height: 26)
                        type.title
                            .font(.NanumExtraBold40)
                            .foregroundStyle(.black2)
                            .multilineTextAlignment(.center)
                        type.icon
                            .resizable()
                            .frame(width: 250, height: 250)
                    }
                }
                
                ZStack {
                    RoundedRectangle(cornerRadius: 25)
                        .fill(.red1.shadow(.inner(color: .shadowRed, radius: 7)))
                        .frame(width: 350, height: 100)
                    HStack(spacing: 20) {
                        Text(type.buttonTitle)
                            .font(.NanumExtraBold36)
                            .foregroundStyle(.white)
                        Image(.iconPlay)
                            .resizable()
                            .frame(width: 52, height: 52)
                        
                    }
                }
            }
            
            
        }
        .buttonStyle(.plain)
        
        
    }
}

//#Preview {
//    ChildrenMenu(type: .conversation)
//}

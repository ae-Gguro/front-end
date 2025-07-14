//
//  MicButton.swift
//  gguro
//
//  Created by 이채은 on 7/15/25.
//
import SwiftUI


struct MicButton: View {
    var body: some View {
        Button(action: {
            // TODO: action 추가 필요
        }){
            ZStack {
                Circle()
                    .fill(.white.shadow(.inner(color: .shadowWhite, radius: 7)))
                    .frame(width: 135, height: 135)
                
                Image(.iconMic)
            }
        }
    }
}

#Preview {
    MicButton()
}

//
//  ThinkingView.swift
//  gguro
//
//  Created by 이채은 on 7/14/25.
//

import SwiftUI

struct ThinkingView: View {
    var body: some View {
        HStack(spacing: 60){
            Image(.imageGguro)
                .resizable()
                .frame(width: 416, height: 416)
            Text("생각하는 중이야..\n조금 기다려줄래?")
                .font(.NanumBold64)
                .foregroundStyle(.white)
                .padding(.trailing, 77)
        }
    }
}

#Preview {
    ThinkingView()
}

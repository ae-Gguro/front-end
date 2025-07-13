//
//  ListeningView.swift
//  gguro
//
//  Created by 이채은 on 7/14/25.
//

import SwiftUI

struct ListeningView: View {
    var body: some View {
        HStack(spacing: 60){
            Image(.imageGguro)
                .resizable()
                .frame(width: 416, height: 416)
            
            Text("계속 말해줘 🎤\n열심히 듣고 있어!")
                .font(.NanumBold64)
                .foregroundStyle(.white)
                .padding(.trailing, 77)
        }
        
    }
}

#Preview {
    ListeningView()
}

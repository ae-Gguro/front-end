//
//  ConversationIntroView.swift
//  gguro
//
//  Created by 이채은 on 7/14/25.
//

import SwiftUI

struct ConversationIntroView: View {
    @Environment(\.childNameAYA) private var childName
    
    var body: some View {
        VStack(spacing: 55) {
            Group {
                Text("안녕 ")
                    .foregroundStyle(.white)
                + Text("\(childName)!")
                    .foregroundStyle(.yellow1)
                + Text("\n꾸로 눈을 바라봐줄래?")
                    .foregroundStyle(.white)
                
                    
                
                Text("대화를 마치고 싶다면\n")
                    .foregroundStyle(.white)
                + Text("그만하고 싶어")
                    .foregroundStyle(.yellow1)
                + Text("라고 말해줘!")
                    .foregroundStyle(.white)
            }
            .font(.NanumBold48)
            .multilineTextAlignment(.center)
        }
    }
}

#Preview {
    ConversationIntroView()
}

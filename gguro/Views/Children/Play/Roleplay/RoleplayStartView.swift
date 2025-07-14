//
//  RoleplayStartView.swift
//  gguro
//
//  Created by 이채은 on 7/15/25.
//

import SwiftUI

struct RoleplayStartView: View {
    var body: some View {
        VStack(spacing: 46){
            (Text("이제 ") + Text("역할 놀이").foregroundStyle(.yellow1) + Text("를 시작하자\n 꾸로 눈을 바라봐줄래?"))
            .foregroundStyle(.white)
            .multilineTextAlignment(.center)
            .font(.NanumBold48)
            
            (Text("대화를 마치고 싶다면\n") + Text("그만하고 싶어").foregroundStyle(.yellow1) + Text("라고 말해줘!"))
                .foregroundStyle(.white)
                .multilineTextAlignment(.center)
                .font(.NanumBold48)
            
        }
    }
}

#Preview {
    RoleplayStartView()
}

//
//  RoleplayStartView.swift
//  gguro
//
//  Created by 이채은 on 7/15/25.
//

import SwiftUI

struct RoleplayStartView: View {
    /// 서버에서 넘어온 꾸로의 대답
    let reply: String
    
    var body: some View {
        VStack(spacing: 46){
            // 서버 응답 표시
            Text(reply)
                .foregroundStyle(.white)
                .multilineTextAlignment(.center)
                .font(.NanumBold48)
                .padding()
            
            // 안내 문구
            (Text("대화를 마치고 싶다면\n") +
             Text("그만하고 싶어").foregroundStyle(.yellow1) +
             Text("라고 말해줘!"))
                .foregroundStyle(.white)
                .multilineTextAlignment(.center)
                .font(.NanumBold48)
        }
    }
}

#Preview {
    RoleplayStartView(reply: "좋아! 지금부터 너는 '공주님', 나는 '왕자님'이야.")
}

//
//  RoleplayIntroView.swift
//  gguro
//
//  Created by 이채은 on 7/15/25.
//

import SwiftUI

struct RoleplayIntroView: View {
    @Environment(\.childNameAYA) private var childNameAYA
    @Environment(\.childName) private var childName
    
    /// 서버에서 넘어온 이름 (RoleplayState.intro(name))
    let name: String
    
    var body: some View {
        VStack(spacing: 46){
            (Text("안녕 ") + Text("\(childNameAYA)").foregroundStyle(.yellow1) + Text("!\n")
            + Text("\(name)와 꾸로의 ") + Text("역할").foregroundStyle(.yellow1) + Text("을 정해줘.")) // ✅ 여기서 name 사용
            .foregroundStyle(.white)
            .multilineTextAlignment(.center)
            .font(.NanumBold48)
            
            (Text("예) \"나는 ") + Text("애기").foregroundStyle(.yellow1) + Text("고 꾸로는 ") + Text("엄마").foregroundStyle(.yellow1) + Text("야\""))
                .foregroundStyle(.white)
                .multilineTextAlignment(.center)
                .font(.NanumBold48)
        }
    }
}

#Preview {
    RoleplayIntroView(name: "아이") // ✅ 미리보기에도 name 전달
}

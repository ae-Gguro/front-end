//
//  LifeStudyIntroView.swift
//  gguro
//
//  Created by 이채은 on 7/15/25.
//

import SwiftUI

struct LifeStudyIntroView: View {
    let name: String
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            VStack(spacing: 46) {
                (Text("안녕 ") + Text("\(name)").foregroundStyle(.yellow1) + Text("야!"))
                    .foregroundStyle(.white)
                    .multilineTextAlignment(.center)
                    .font(.NanumBold48)
                
                (Text("오늘은 \"") + Text("횡단보도는 초록불에 건너요").foregroundStyle(.yellow1) + Text("라는\n중요한 안전 규칙에 대해 배워볼 거야."))
                    .foregroundStyle(.white)
                    .multilineTextAlignment(.center)
                    .font(.NanumBold48)
                
                Text("꾸로가 퀴즈를 내볼테니 맞혀볼래?")
                    .font(.NanumBold48)
                    .foregroundStyle(.white)
                
            }
            
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            MicButton() //TODO: 하드코딩 수정하기
                .padding(.bottom, 122)
                .padding(.trailing, 144)
        }
    }
}

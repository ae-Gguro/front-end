//
//  QuizIntroView.swift
//  gguro
//
//  Created by 이채은 on 7/14/25.
//

import SwiftUI

struct QuizIntroView: View {
    @State private var viewModel = WordQuizViewModel()
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            VStack {
                
                Text(viewModel.wordQuizSample[0].fullQuestion)
                    .font(.NanumBold64)
                    .foregroundStyle(.white)
                
                Spacer().frame(height: 72)
                
                HStack(spacing: 30) {
                    ForEach(viewModel.wordQuizSample[0].hint, id: \.self) { hint in
                        ZStack {
                            RoundedRectangle(cornerRadius: 30)
                                .strokeBorder(.red1, lineWidth: 10)
                                .frame(width: 200, height: 200)
                                .background(RoundedRectangle(cornerRadius: 30).fill(.white))
                            
                            
                            Text(hint)
                                .font(.PretendardSemiBold128)
                                .foregroundStyle(.red1)
                        }
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            MicButton() //TODO: 하드코딩 수정하기
                .padding(.bottom, 122)
                .padding(.trailing, 144)
        }
    }
}




#Preview {
    QuizIntroView()
}

//
//  QuizRevealAnswerView.swift
//  gguro
//
//  Created by 이채은 on 7/15/25.
//

import SwiftUI

struct QuizRevealAnswerView: View {
    @State private var viewModel = WordQuizViewModel()
    
    var body: some View {
        let quiz = viewModel.wordQuizSample[0]
        
        ZStack(alignment: .bottomTrailing) {
            
            VStack {
                
                
                Text(quiz.fullQuestion)
                    .font(.NanumBold64)
                    .foregroundStyle(.white)
                
                
                
                Spacer().frame(height: 72)
                
                ZStack {
                    
                    HStack(spacing: 30) {
                        ForEach(Array(quiz.correctAnswer), id: \.self) { char in
                            ZStack {
                                RoundedRectangle(cornerRadius: 30)
                                    .strokeBorder(.red1, lineWidth: 10)
                                    .frame(width: 200, height: 200)
                                    .background(RoundedRectangle(cornerRadius: 30).fill(.white))
                                
                                Text(String(char))
                                    .font(.PretendardSemiBold128)
                                    .foregroundStyle(.red1)
                            }
                        }
                    }
                    
                }
                
                Spacer().frame(height: 46)
                
                
                
                (Text("정답은") + Text(viewModel.wordQuizSample[0].correctAnswer)
                    .foregroundStyle(.yellow1)
                 + Text("였어!\n 화면을 클릭해서 다음 퀴즈를 풀어보자"))
                .multilineTextAlignment(.center)
                .font(.NanumExtraBold28)
                .foregroundStyle(.white)
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            MicButton() //TODO: 하드코딩 수정하기
                .padding(.bottom, 122)
                .padding(.trailing, 144)
        }
    }
}

#Preview {
    QuizRevealAnswerView()
}

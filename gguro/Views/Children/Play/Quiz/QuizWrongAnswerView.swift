//
//  QuizWrongAnswerView.swift
//  gguro
//
//  Created by 이채은 on 7/15/25.
//


import SwiftUI

struct QuizWrongAnswerView: View {
    @State private var viewModel = WordQuizViewModel()
    
    var body: some View {
        let quiz = viewModel.wordQuizSample[0]
        
        ZStack(alignment: .bottomTrailing) {
            
            VStack {
                
                if let range = quiz.fullQuestion.range(of: quiz.highlightPart) {
                    let before = String(quiz.fullQuestion[..<range.lowerBound])
                    let after = String(quiz.fullQuestion[range.upperBound...])
                    
                    (
                        Text(before)
                        + Text(quiz.highlightPart).foregroundStyle(.yellow1)
                        + Text(after)
                    )
                    .font(.NanumBold64)
                    .foregroundStyle(.white)
                }
                
                
                Spacer().frame(height: 72)
                
                ZStack {
                    
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
                
                Spacer().frame(height: 46)
                
                
                (Text(viewModel.wordQuizSample[0].childAnswer)
                    .foregroundStyle(.yellow1)
                 + Text("는 정답이 아니야.\n 다시 생각해볼까?"))
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
    QuizWrongAnswerView()
}

//
//  QuizEndedView.swift
//  gguro
//
//  Created by 이채은 on 7/14/25.
//

import SwiftUI

struct QuizEndedView: View {
    
    var body: some View {
        VStack {
            HStack(spacing: -24) {
                Image(.imageGguro)
                    .resizable()
                    .frame(width: 416, height: 416)
                
                VStack {
                    Spacer().frame(height: 20)
                    
                    Text("대단해!\n오늘 준비된 단어를 다 풀었어!")
                        .font(.NanumBold64)
                        .foregroundStyle(.white)
                        .multilineTextAlignment(.leading)
                        .padding(.trailing, 90)
                        .fixedSize(horizontal: false, vertical: true)
                    
                    Spacer().frame(height: 40)
                    
                    //TODO: 점수... 가져오기..
                    Text("오늘의 점수: 4/5")
                        .font(.NanumExtraBold28)
                        .foregroundStyle(.white)
                        .padding(.trailing, 672)
                }
                
            }
            Spacer().frame(height: -36)
            
            HStack(spacing: 15){
                Spacer().frame(width: 682)
                SelectButton(text: "다시 풀기")
                
                SelectButton(text: "그만하기")
                    .padding(.trailing, 50)
                
            }
        }
        .frame(maxWidth: .infinity)
    }
}


#Preview {
    QuizEndedView()
}

//
//  AnimalStudyIntroView.swift
//  gguro
//
//  Created by 이채은 on 7/15/25.
//

import SwiftUI

struct AnimalStudyIntroView: View {
    @Environment(\.childNameAYA) private var childName
    @State private var viewModel = AnimalViewModel()
    
    var body: some View {
        let img = Image(viewModel.animalMenuList[0].imageName)
        ZStack(alignment: .bottomTrailing) {
            HStack(spacing: 65) {
                
                ZStack {
                    Circle()
                        .strokeBorder(.red2, lineWidth: 1)
                        .frame(width: 314, height: 314)
                        .background(Circle().fill(.red3))
                    img
                        .resizable()
                        .frame(width: 260, height: 260)
                }
                
                Text("안녕! \(childName)\n나는 용맹하고 멋진 호랑이야")
                    .foregroundStyle(.white)
                    .font(.NanumBold48)
            }
            
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            MicButton() //TODO: 하드코딩 수정하기
                .padding(.bottom, 122)
                .padding(.trailing, 144)
        }
    }
}

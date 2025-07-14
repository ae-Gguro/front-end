//
//  ModelView.swift
//  gguro
//
//  Created by 김미주 on 7/15/25.
//

import SwiftUI

struct ModalView: View {
    var type: ModalType
    var onLeftButtonTap: () -> Void
    var onRightButtonTap: () -> Void
    
    var body: some View {
        ZStack {
            Color.white.opacity(0.3)
                .ignoresSafeArea()
            
            RoundedRectangle(cornerRadius: 25)
                .fill(.white.shadow(.inner(color: .shadowWhite, radius: 7)))
                .frame(width: 890, height: 445)
            
            VStack(spacing: 0) {
                Text(type.title)
                    .font(.NanumExtraBold55)
                    .foregroundStyle(.black1)
                
                Text(type.subTitle)
                    .font(.NanumExtraBold32)
                    .foregroundStyle(.black1)
                    .multilineTextAlignment(.center)
                    .frame(height: 100)
                    .padding(.top, 9)
                    .padding(.bottom, 42)
                
                HStack(spacing: 50) {
                    Button(action: onLeftButtonTap) {
                        Text(type.leftButtonTitle)
                            .font(.NanumExtraBold32)
                            .foregroundStyle(.white)
                            .frame(width: 300, height: 70)
                            .background {
                                RoundedRectangle(cornerRadius: 35)
                                    .fill(.red1.shadow(.inner(color: .shadowRed, radius: 7)))
                            }
                    }
                    .buttonStyle(.plain)
                    
                    Button(action: onRightButtonTap) {
                        Text(type.rightButtonTitle)
                            .font(.NanumExtraBold32)
                            .foregroundStyle(.white)
                            .frame(width: 300, height: 70)
                            .background {
                                RoundedRectangle(cornerRadius: 35)
                                    .fill(.blue1.shadow(.inner(color: .shadowBlue, radius: 7)))
                            }
                    }
                    .buttonStyle(.plain)
                }
            }
        }
    }
}

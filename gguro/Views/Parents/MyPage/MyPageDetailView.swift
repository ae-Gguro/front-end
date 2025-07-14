//
//  MyPageDetailView.swift
//  gguro
//
//  Created by 김미주 on 7/14/25.
//

import SwiftUI

struct MyPageDetailView: View {
    var body: some View {
        ZStack {
            BackgroundImage()
            
            VStack(spacing: 24) {
                ParentsHeaderView()
                
                // 상단 메뉴
                ZStack {
                    HStack {
                        BackButton(color: "blue")
                        Spacer()
                    }
                    .padding(.horizontal, 45)
                    
                    MessageBox(content: Text("아이 프로필"))
                }
                
                HStack(spacing: 18) {
                    LeftGroup
                    
                    RightGroup
                }
                .padding(.horizontal, 130)
                .padding(.top, 26)
                .padding(.bottom, 80)
            }
        }
    }
    
    // 왼쪽 페이지
    private var LeftGroup: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .fill(.white.shadow(.inner(color: .shadowWhite, radius: 7)))
            
            VStack {
                Text("OO의 프로필")
                    .font(.NanumExtraBold32)
                    .foregroundStyle(.black1)
                
                // 프로필
                ProfileGroup
                    .padding(.top, 50)
                    .padding(.bottom, 180)
                
                // 삭제 버튼
                Button(action: {}) { // TODO: action
                    Text("짱구 프로필 삭제하기")
                        .font(.PretendardRegular24)
                        .foregroundStyle(.black1)
                        .underline()
                }
                .buttonStyle(.plain)
            }
        }
    }
    
    // 아이 프로필
    private var ProfileGroup: some View {
        HStack(spacing: 20) {
            Circle() // TODO: 아이 이미지
                .frame(width: 180, height: 180)
            
            VStack(alignment: .leading, spacing: 15) {
                HStack(spacing: 10) {
                    Text("OO")
                        .font(.NanumExtraBold28)
                        .foregroundStyle(.black1)
                    
                    Button(action: {}) { // TODO: action
                        Image(.iconEdit)
                    }
                }
                
                Text("0000.00.00")
                    .font(.NanumExtraBold19)
                    .foregroundStyle(.gray1)
            }
        }
    }
    
    
    // 오른쪽 페이지
    private var RightGroup: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 25)
                .fill(.white.shadow(.inner(color: .shadowWhite, radius: 7)))
            
            VStack(alignment: .leading, spacing: 70) {
                // 감정 분석
                VStack(alignment: .leading, spacing: 35) {
                    Text("📊 OO의 감정 분석")
                        .font(.NanumExtraBold32)
                        .foregroundStyle(.black1)
                    
                    VStack(spacing: 30) {
                        Button(action: {}) { // TODO: action
                            Text("감정 분석 기록 보러 가기")
                                .font(.PretendardRegular24)
                                .foregroundStyle(.black1)
                                .underline()
                        }
                        .buttonStyle(.plain)
                        
                        Button(action: {}) { // TODO: action
                            Text("관계 개선 조언 보러 가기")
                                .font(.PretendardRegular24)
                                .foregroundStyle(.black1)
                                .underline()
                        }
                        .buttonStyle(.plain)
                    }
                    .padding(.leading, 40)
                }
                
                // 대화 기록
                VStack(alignment: .leading, spacing: 35) {
                    Text("📚 OO의 대화 기록")
                        .font(.NanumExtraBold32)
                        .foregroundStyle(.black1)
                    
                    VStack(spacing: 30) {
                        Button(action: {}) { // TODO: action
                            Text("대화 기록 보러 가기")
                                .font(.PretendardRegular24)
                                .foregroundStyle(.black1)
                                .underline()
                        }
                        .buttonStyle(.plain)
                    }
                    .padding(.leading, 40)
                }
                
                // 설정
                VStack(alignment: .leading, spacing: 35) {
                    Text("⚙️ 설정")
                        .font(.NanumExtraBold32)
                        .foregroundStyle(.black1)
                    
                    VStack(spacing: 30) {
                        Button(action: {}) { // TODO: action
                            Text("계정 탈퇴하기")
                                .font(.PretendardRegular24)
                                .foregroundStyle(.black1)
                                .underline()
                        }
                        .buttonStyle(.plain)
                    }
                    .padding(.leading, 40)
                }
            }
            .padding(.leading, 70)
            
        }
    }
}

#Preview {
    MyPageDetailView()
}

//
//  MyPageView.swift
//  gguro
//
//  Created by 김미주 on 6/4/25.
//

import SwiftUI

struct MyPageView: View {
    @Environment(NavigationRouter<MypageRoute>.self) private var router
    
    @State var showDeleteModal: Bool = false
    @State var showWithdrawModal: Bool = false
    
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
            
            // 삭제 모달
            if showDeleteModal {
                ModalView(
                    type: .delete,
                    onLeftButtonTap: {
                        // TODO: delete action
                    },
                    onRightButtonTap: {
                        showDeleteModal = false
                    }
                )
            }
            
            // 탈퇴 모달
            if showWithdrawModal {
                ModalView(
                    type: .withdraw,
                    onLeftButtonTap: {
                        // TODO: withdraw action
                    },
                    onRightButtonTap: {
                        showWithdrawModal = false
                    }
                )
            }
        }
    }
    
    // 왼쪽 페이지
    private var LeftGroup: some View {
        VStack {
            HStack {
                ProfileGroup
                
                Spacer()
            }
            .padding(.horizontal, 35)
            .padding(.vertical, 25)
            .background(
                RoundedRectangle(cornerRadius: 25)
                    .fill(.white.shadow(.inner(color: .shadowWhite, radius: 7)))
            )
            
            ZStack {
                RoundedRectangle(cornerRadius: 25)
                    .fill(.white.shadow(.inner(color: .shadowWhite, radius: 7)))
                
                ReportCalendarView()
            }
        }
    }
    
    // 아이 프로필
    private var ProfileGroup: some View {
        HStack(spacing: 35) {
            Circle() // TODO: 아이 이미지
                .frame(width: 120, height: 120)
            
            VStack(alignment: .leading, spacing: 15) {
                Text("OO")
                    .font(.NanumExtraBold28)
                    .foregroundStyle(.black1)
                
                Text("0000.00.00")
                    .font(.NanumExtraBold19)
                    .foregroundStyle(.gray1)
            }
        }
    }
    
    
    // 오른쪽 페이지
    private var RightGroup: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .fill(.white.shadow(.inner(color: .shadowWhite, radius: 7)))
            
            VStack(spacing: 40) {
                // 감정 분석
                VStack(spacing: 15) {
                    Text("📊 OO의 감정 분석")
                        .font(.NanumExtraBold28)
                        .foregroundStyle(.black1)
                    
                    VStack(spacing: 10) {
                        makeMypageButton(type: .reportToday)
                        
                        makeMypageButton(type: .reportWeek)
                    }
                }
                
                // 대화 기록
                VStack(spacing: 15) {
                    Text("📚 OO의 대화 기록")
                        .font(.NanumExtraBold28)
                        .foregroundStyle(.black1)
                    
                    makeMypageButton(type: .conversation)
                }
                
                // 설정
                VStack(spacing: 15) {
                    Text("⚙️ 설정")
                        .font(.NanumExtraBold28)
                        .foregroundStyle(.black1)
                    
                    makeMypageButton(type: .setting)
                }
            }
        }
    }
    
    private func makeMypageButton(type: MypageButtonType) -> some View {
        Button(action: {
            switch type {
            case .reportToday:
                router.push(.emotionToday)
            case .reportWeek:
                router.push(.emotionWeek)
            case .conversation:
                router.push(.conversation)
            case .setting:
                router.push(.setting)
            }
        }) {
            Text(type.title)
                .font(.NanumBold20)
                .foregroundStyle(.black1)
                .padding(.vertical, 20)
                .frame(maxWidth: .infinity)
                .background(
                    RoundedRectangle(cornerRadius: 25)
                        .fill(.white.shadow(.inner(color: .shadowWhite, radius: 7)))
                )
                .padding(.horizontal, 55)
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    MyPageView()
        .environment(NavigationRouter<MypageRoute>())
}

//
//  SettingView.swift
//  gguro
//
//  Created by 김미주 on 8/23/25.
//

import SwiftUI

struct SettingView: View {
    @Environment(\.childName) private var childName
    @Environment(NavigationRouter<MypageRoute>.self) private var router
    
    @State var isAllOn: Bool = false
    @State var isServiceOn: Bool = false
    @State var isTodayOn: Bool = false
    @State var isWeekOn: Bool = false
    
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
                    
                    MessageBox(content: Text("설정"))
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
        .navigationBarBackButtonHidden()
    }
    
    // 왼쪽 페이지
    private var LeftGroup: some View {
        ZStack(alignment: .top) {
            RoundedRectangle(cornerRadius: 25)
                .fill(.white.shadow(.inner(color: .shadowWhite, radius: 7)))
            
            VStack(spacing: 15) {
                Text("알림 설정")
                    .font(.NanumExtraBold28)
                    .padding(.bottom, 15)
                
                NotificationList(type: .all, isOn: $isAllOn)
                NotificationList(type: .service, isOn: $isServiceOn)
                NotificationList(type: .today, isOn: $isTodayOn)
                NotificationList(type: .week, isOn: $isWeekOn)
            }
            .padding(.top, 50)
        }
    }
    
    // 알림 리스트
    private func NotificationList(type: NotificationType, isOn: Binding<Bool>) -> some View {
        VStack(alignment: .leading) {
            ZStack {
                RoundedRectangle(cornerRadius: 25)
                    .fill(.white.shadow(.inner(color: .shadowWhite, radius: 7)))
                    .frame(height: 60)
                
                HStack {
                    Text(type.title)
                        .font(.NanumBold20)
                        .foregroundStyle(.black1)
                    
                    Spacer()
                    
                    Button(action: {
                        withAnimation(.easeInOut(duration: 0.2)) {
                            isOn.wrappedValue.toggle()
                        }
                    }) {
                        ZStack(alignment: isOn.wrappedValue ? .trailing : .leading) {
                            RoundedRectangle(cornerRadius: 20)
                                .fill(
                                    (isOn.wrappedValue ? Color.blue1 : Color.white)
                                        .shadow(.inner(color: isOn.wrappedValue ? .shadowBlue : .shadowWhite, radius: 7))
                                )
                                .frame(width: 80, height: 40)
                            
                            Text(isOn.wrappedValue ? "On" : "Off")
                                .font(.NanumBold12)
                                .foregroundStyle(.black1)
                                .frame(width: 32, height: 32)
                                .background {
                                    Circle()
                                        .fill(isOn.wrappedValue ? .white : .gray2)
                                }
                                .padding(.horizontal, 4)
                        }
                    }
                }
                .padding(.leading, 35)
                .padding(.trailing, 10)
            }
            
            Text(type.guideText)
                .font(.NanumBold12)
                .foregroundStyle(.gray1)
                .padding(.leading, 10)
        }
        .padding(.horizontal, 55)
    }
    
    // 오른쪽 페이지
    private var RightGroup: some View {
        ZStack(alignment: .top) {
            RoundedRectangle(cornerRadius: 25)
                .fill(.white.shadow(.inner(color: .shadowWhite, radius: 7)))
            
            VStack(spacing: 20) {
                Text("계정 관리")
                    .font(.NanumExtraBold28)
                    .padding(.bottom, 10)
                
                AccountList(title: "\(childName) 프로필 수정하기", color: .black1, action: {
                    router.push(.edit)
                })
                AccountList(title: "로그아웃", color: .black, action: {
                    // TODO: 로그아웃 모달
                })
                AccountList(title: "\(childName) 프로필 삭제하기", color: .red1, action: {
                    // TODO: 삭제 모달
                })
                AccountList(title: "계정 탈퇴하기", color: .red1, action: {
                    // TODO: 탈퇴 모달
                })
            }
            .padding(.top, 50)
        }
    }
    
    private func AccountList(title: String, color: Color, action: (() -> Void)?) -> some View {
        Button(action: {
            action
        }) {
            ZStack {
                RoundedRectangle(cornerRadius: 25)
                    .fill(.white.shadow(.inner(color: .shadowWhite, radius: 7)))
                    .frame(height: 60)
                
                Text(title)
                    .font(.NanumBold20)
                    .foregroundStyle(color)
            }
        }
        .padding(.horizontal, 55)
    }
}

#Preview {
    SettingView()
        .environment(NavigationRouter<MypageRoute>())
}

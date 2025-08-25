//
//  HeaderView.swift
//  gguro
//
//  Created by 김미주 on 7/13/25.
//

import SwiftUI

struct ParentsHeaderView: View {
    @Environment(NavigationRouter<ParentsRoute>.self) private var router
    @EnvironmentObject var viewModel: ProfileSelectViewModel
    
    @State private var showChildrenView: Bool = false
    @State private var showMypageView: Bool = false
    
    var body: some View {
        HStack(spacing: 25) {
            ProfileGroup
            
            Spacer()
            
            MenuGroup
        }
        .padding(.top, 30)
        .padding(.leading, 40)
        .padding(.trailing, 30)
        .fullScreenCover(isPresented: $showChildrenView) {
            ChildrenMainView() // TODO: Container로 수정
        }
        .fullScreenCover(isPresented: $showMypageView) {
            MypageContainer()
        }
    }
    
    private var ProfileGroup: some View {
        HStack(spacing: 25) {
            ForEach(Array(viewModel.profileList.enumerated()), id: \.element.profileId) { index, item in
                HeaderChildProfile(
                    color: setProfileColor(index),
                    profile: item,
                    isEnabled: viewModel.selectedProfileId == item.profileId
                )
            }
        }
    }
    
    private var MenuGroup: some View {
        HStack(spacing: 20) {
            HeaderMenu(type: .children)
                .onTapGesture {
                    showChildrenView = true
                }
            HeaderMenu(type: .mypage)
                .onTapGesture {
                    showMypageView = true
                }
            HeaderMenu(type: .home)
                .onTapGesture {
                    router.reset()
                }
        }
    }
    
    // MARK: - Fucntions
    private func setProfileColor(_ index: Int) -> ProfileColor {
        switch index {
        case 0:
            return .red
        case 1:
            return .blue
        case 2:
            return .green
        default:
            return .yellow
        }
    }
}

#Preview {
    ParentsHeaderView()
}

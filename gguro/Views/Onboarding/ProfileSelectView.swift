//
//  ProfileSelectView.swift
//  gguro
//
//  Created by 김미주 on 5/21/25.
//

import SwiftUI

struct ProfileSelectView: View {
    @Environment(NavigationRouter<ProfileRoute>.self) private var router
    @StateObject var viewModel = ProfileSelectViewModel()
    
    var body: some View {
        ZStack {
            BackgroundImage()
            
            VStack(spacing: 103) {
                MessageBox(content:
                            Text("아이의 ") +
                           Text("프로필").foregroundStyle(.red1) +
                           Text("을 선택해 주세요!")
                )
                
                HStack(spacing: 130) {
                    ForEach(viewModel.profileList, id: \.profileId) { item in
                        ProfileSelectButton(viewModel: viewModel, profileImg: item.profileImageUrl, name: item.profileName)
                    }
                    if viewModel.profileList.count < 3 {
                        ProfileCreateButton(type: .onboarding)
                    }
                }
            }
        }
        .task {
            viewModel.fetchProfileList()
        }
        .fullScreenCover(isPresented: $viewModel.isSelected) {
            ChildrenMainView()
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    ProfileSelectView()
}

//
//  ProfileSelectView.swift
//  gguro
//
//  Created by 김미주 on 5/21/25.
//

import SwiftUI

struct ProfileSelectView: View {
    @StateObject var viewModel = ProfileSelectViewModel()
    
    var body: some View {
        NavigationStack {
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
                            ProfileSelectButton(profileImg: item.profileImageUrl, name: item.profileName)
                            
                            if viewModel.profileList.count < 3 {
                                ProfileCreateButton(type: .onboarding)
                            }
                        }
                    }
                }
            }
            .onAppear {
                viewModel.fetchProfileList()
            }
            .toolbar(.hidden)
        }
    }
}

#Preview {
    ProfileSelectView()
}

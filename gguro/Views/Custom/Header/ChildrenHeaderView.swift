//
//  ChildrenHeaderView.swift
//  gguro
//
//  Created by 이채은 on 7/13/25.
//

import SwiftUI

struct ChildrenHeaderView: View {
    @EnvironmentObject var viewModel: ProfileSelectViewModel
    
    @State private var showParentsView: Bool = false
    
    var body: some View {
        
        HStack(spacing: 20) {
            ProfileGroup
            
            Spacer()
            
            ButtonGroup
        }
        .padding(.horizontal, 35)
        .padding(.top, 0)
        .task {
            viewModel.fetchProfileList()
        }
        .fullScreenCover(isPresented: $showParentsView) {
            ParentsContainer()
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
    
    private var ButtonGroup: some View {
        HStack(spacing: 20){
            HeaderMenu(type: .parents)
                .onTapGesture {
                    showParentsView = true
                }
            HeaderMenu(type: .home)
                .onTapGesture {
                    // TODO: ChildRoute reset
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
    ChildrenHeaderView()
}

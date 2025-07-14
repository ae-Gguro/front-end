//
//  RoleplayConfirmView.swift
//  gguro
//
//  Created by 이채은 on 7/15/25.
//
import SwiftUI

struct RoleplayConfirmView: View {
    @State private var viewModel = RoleplayViewModel()
    let name: String
    
    var body: some View {
        let userRole = viewModel.roleplaySample[0].userRole
        let botRole = viewModel.roleplaySample[0].botRole
        
        VStack(spacing: 46){
            (Text("\(name)는 ") + Text(userRole).foregroundStyle(.yellow1) + Text(", 꾸로는 ") + Text(botRole).foregroundStyle(.yellow1) + Text(" 맞아?"))
            .foregroundStyle(.white)
            .multilineTextAlignment(.center)
            .font(.NanumBold48)
            
            Text("아니라면 다시 말해줘!")
                .foregroundStyle(.white)
                .font(.NanumBold48)
            
        }
    }
}

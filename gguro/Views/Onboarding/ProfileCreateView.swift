//
//  ProfileCreateView.swift
//  gguro
//
//  Created by 김미주 on 5/21/25.
//

import SwiftUI

struct ProfileCreateView: View {
    @Environment(NavigationRouter<ProfileRoute>.self) private var router
    
    @StateObject var viewModel = ProfileCreateViewModel()
    var type: ProfileCreateType
    
    @State private var lastName: String = ""
    @State private var firstName: String = ""
    @State private var year: String = ""
    @State private var month: String = ""
    @State private var day: String = ""
    @State private var profileImg: UIImage? = nil
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            BackgroundImage()
            
            BackButton(color: type.color)
                .padding(.leading, 70)
                .padding(.top, 60)
            
            VStack(spacing: 30) {
                Spacer().frame(height: 40)
                
                ProfileImageUploadButton(selectedImage: $profileImg)
                
                InputWithName(lastName: $lastName, firstName: $firstName)
                InputWithBirth(year: $year, month: $month, day: $day)
                
                Spacer().frame(height: 110)
                
                ProfileButton(color: type.color, title: "프로필 추가", action: {
                    let stringImage = viewModel.convertImageToBase64(profileImg)

                    viewModel.fetchCreateProfile(
                        firstName: firstName,
                        lastName: lastName,
                        year: Int(year) ?? 0,
                        month: Int(month) ?? 0,
                        day: Int(day) ?? 0,
                        image: stringImage
                    ) {
                        router.pop()
                    }
                })
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    ProfileCreateView(type: .onboarding)
}

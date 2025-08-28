//
//  ProfileImageUploadButton.swift
//  gguro
//
//  Created by 김미주 on 6/26/25.
//

import SwiftUI
import PhotosUI

struct ProfileImageUploadButton: View {
    @Binding var selectedImage: UIImage?
    @State var selectedItem: PhotosPickerItem? = nil
    
    var body: some View {
        PhotosPicker(
            selection: $selectedItem,
            matching: .images
        ) {
            VStack(spacing: 15) {
                ZStack {
                    RoundedRectangle(cornerRadius: 30)
                        .fill(.gray3.shadow(.inner(color: .shadowWhite, radius: 7)))
                        .frame(width: 160, height: 160)
                    if let selectedImage {
                        Image(uiImage: selectedImage)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 160, height: 160)
                            .clipShape(RoundedRectangle(cornerRadius: 30))
                    } else {
                        Image(.iconPlus)
                            .resizable()
                            .frame(width: 52, height: 52)
                    }
                }
                
                Text("프로필 사진")
                    .font(.NanumExtraBold28)
                    .foregroundStyle(.black1)
            }
        }
        .onChange(of: selectedItem) {
            guard let selectedItem else { return }
            
            Task {
                if let data = try? await selectedItem.loadTransferable(type: Data.self),
                   let uiImage = UIImage(data: data) {
                    selectedImage = uiImage
                }
            }
        }
        .buttonStyle(.plain)
    }
}

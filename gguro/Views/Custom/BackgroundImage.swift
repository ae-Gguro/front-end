//
//  BackgroundImage.swift
//  gguro
//
//  Created by 김미주 on 6/4/25.
//

import SwiftUI

struct BackgroundImage: View {
    var body: some View {
        Image(.imageBackground)
            .resizable()
            .scaledToFill()
            .ignoresSafeArea()
    }
}

#Preview {
    BackgroundImage()
}

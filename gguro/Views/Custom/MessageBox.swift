//
//  MessageBox.swift
//  gguro
//
//  Created by 김미주 on 6/26/25.
//

import SwiftUI

struct MessageBox: View {
    var content: Text
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 50)
                .fill(.white)
                .insetShadow()
                .frame(width: 700, height: 100)
            content
                .foregroundStyle(.black1)
                .font(.NanumExtraBold36)
        }
    }
}

#Preview {
    MessageBox(content: Text("Test"))
}

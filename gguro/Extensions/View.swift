//
//  View.swift
//  gguro
//
//  Created by 김미주 on 6/26/25.
//

import SwiftUI

// 안쪽 그림자
struct InsetShadowModifier: ViewModifier {
    var color: Color = .shadowWhite
    var radius: CGFloat = 3
    var cornerRadius: CGFloat = 50

    func body(content: Content) -> some View {
        content
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(color, lineWidth: 3)
                    .blur(radius: radius)
                    .mask(
                        RoundedRectangle(cornerRadius: cornerRadius)
                            .fill(Color.black)
                    )
            )
    }
}

extension View {
    func insetShadow(
        color: Color = .shadowWhite,
        radius: CGFloat = 3,
        cornerRadius: CGFloat = 50
    ) -> some View {
        self.modifier(InsetShadowModifier(color: color, radius: radius, cornerRadius: cornerRadius))
    }
}

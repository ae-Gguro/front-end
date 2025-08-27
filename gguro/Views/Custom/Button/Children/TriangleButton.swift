//
//  TriangleButton.swift
//  gguro
//
//  Created by 이채은 on 7/15/25.
//

import SwiftUI


struct TriangleButton: View {
    enum Direction {
        case left, right
    }

    var direction: Direction
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            Image(direction == .left ? "icon_polygon_left" : "icon_polygon_right")
                .resizable()
                .frame(width: 65, height: 65)
        }
    }
}

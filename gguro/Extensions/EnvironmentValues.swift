//
//  EnvironmentValues.swift
//  gguro
//
//  Created by 김미주 on 8/27/25.
//

import Foundation
import SwiftUI

private struct ChildNameKey: EnvironmentKey {
    static let defaultValue: String = ""
}

extension EnvironmentValues {
    var childName: String {
        get {
            self[ChildNameKey.self]
        } set {
            self[ChildNameKey.self] = newValue
        }
    }
}

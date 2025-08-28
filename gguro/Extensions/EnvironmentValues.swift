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

private struct ChildNameAYAKey: EnvironmentKey {
    static let defaultValue: String = ""
}

private struct ChildNameIGAKey: EnvironmentKey {
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
    
    var childNameAYA: String {
        get {
            self[ChildNameAYAKey.self]
        } set {
            self[ChildNameAYAKey.self] = newValue
        }
    }
    
    var childNameIGA: String {
        get {
            self[ChildNameIGAKey.self]
        } set {
            self[ChildNameIGAKey.self] = newValue
        }
    }
}

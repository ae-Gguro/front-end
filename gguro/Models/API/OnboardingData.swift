//
//  OnboardingData.swift
//  gguro
//
//  Created by 김미주 on 7/22/25.
//

import Foundation

// MARK: - signup
struct SignupData: Codable {
    let username: String
    let password: String
}

// MARK: - login
struct LoginData: Codable {
    let username: String
    let password: String
}

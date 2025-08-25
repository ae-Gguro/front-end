//
//  ProfileData.swift
//  gguro
//
//  Created by 김미주 on 7/27/25.
//

import Foundation

// MARK: - 아이 프로필 생성
struct ProfileCreateData: Codable {
    let firstName: String
    let lastName: String
    let year: Int
    let month: Int
    let day: Int
    let image: String?
}

// MARK: - 아이 프로필 삭제
struct ProfilePatchData: Codable {
    let firstName: String?
    let lastName: String?
    let year: Int?
    let month: Int?
    let day: Int?
}

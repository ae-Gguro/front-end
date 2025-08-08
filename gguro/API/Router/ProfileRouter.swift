//
//  ProfileRouter.swift
//  gguro
//
//  Created by 김미주 on 7/27/25.
//

import Foundation
import Moya

// MARK: - 프로필 관련 API
enum ProfileRouter {
    case postProfileCreate(profileData: ProfileCreateData)
    case getProfileDetail(profileId: Int)
    case deleteProfile(profileId: Int)
    case patchProfile(profileId: Int, profileData: ProfilePatchData)
    case getProfiles
}

extension ProfileRouter: APITargetType {
    private static let profilePath = "/api/profile"
    
    var path: String {
        switch self {
        case .postProfileCreate:
            return "\(Self.profilePath)/create"
        case .getProfileDetail(let profileId):
            return "\(Self.profilePath)/\(profileId)"
        case .deleteProfile(let profileId):
            return "\(Self.profilePath)/\(profileId)"
        case .patchProfile(let profileId, _):
            return "\(Self.profilePath)/\(profileId)"
        case .getProfiles:
            return "\(Self.profilePath)s"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .postProfileCreate:
            return .post
        case .getProfileDetail, .getProfiles:
            return .get
        case .deleteProfile:
            return .delete
        case .patchProfile:
            return .patch
        }
    }
    
    var task: Task {
        switch self {
        case .postProfileCreate(let profileData):
            var multipartData = [MultipartFormData]()

            // 1. JSON 인코딩된 데이터 생성
            if let jsonData = try? JSONEncoder().encode(profileData) {
                multipartData.append(MultipartFormData(provider: .data(jsonData),
                                                       name: "request",
                                                       mimeType: "application/json"))
            }

            // 2. 이미지 추가
            if let imageBase64 = profileData.image,
               let imageData = Data(base64Encoded: imageBase64) {
                multipartData.append(MultipartFormData(provider: .data(imageData),
                                                       name: "image",
                                                       fileName: "profile.jpg",
                                                       mimeType: "image/jpeg"))
            }

            return .uploadMultipart(multipartData)
        case .getProfileDetail:
            return .requestPlain
        case .deleteProfile:
            return .requestPlain
        case .patchProfile(_, let profileData):
            return .requestJSONEncodable(profileData)
        case .getProfiles:
            return .requestPlain
        }
    }
}

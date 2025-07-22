//
//  Config.swift
//  gguro
//
//  Created by 김미주 on 7/22/25.
//

import Foundation

enum Config {
    private static let infoDictionary: [String: Any] = {
        guard let dict = Bundle.main.infoDictionary else {
            fatalError("Plist 없음")
        }
        return dict
    }()
    
    static let baseURL: String = {
        guard let baseURL = Config.infoDictionary["API_URL"] as? String else {
            fatalError()
        }
        return baseURL
    }()
}

//
//  AdviceResponse.swift
//  gguro
//
//  Created by 김미주 on 8/27/25.
//

import Foundation

struct AdviceResponse: Decodable {
    let profile_id: Int
    let advice: String
}

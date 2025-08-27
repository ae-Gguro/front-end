//
//  BasicResponse.swift
//  gguro
//
//  Created by 김미주 on 8/27/25.
//

import Foundation

struct BasicResponse: Decodable {
    let isSuccess: Bool
    let code: String
    let message: String
    let result: String
}

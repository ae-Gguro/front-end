//
//  BaseTarget.swift
//  gguro
//
//  Created by 김미주 on 7/22/25.
//

import Foundation
import Moya

protocol BaseTarget: TargetType {}

extension BaseTarget {
    var baseURL: String {
        return Config.baseURL
    }
}

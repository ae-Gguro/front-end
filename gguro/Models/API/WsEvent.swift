//
//  WsEvent.swift
//  gguro
//
//  Created by 이채은 on 8/28/25.
//

import Foundation

struct WsEvent: Codable {
    let event: String
    let payload: [String: String]?
}

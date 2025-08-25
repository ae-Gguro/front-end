//
//  EmotionVariationModel.swift
//  gguro
//
//  Created by 김미주 on 7/14/25.
//

import Foundation

struct EmotionVariationList: Hashable {
    let talk_id: Int
    let text: String
    let positive: Bool
}

struct EmotionVariationDate: Identifiable {
    let id = UUID()
    let date: String
    let list: [EmotionVariationList]
}

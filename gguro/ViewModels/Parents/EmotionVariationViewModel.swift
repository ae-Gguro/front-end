//
//  EmotionVariationViewModel.swift
//  gguro
//
//  Created by 김미주 on 7/14/25.
//

import Foundation

@Observable
class EmotionVariationViewModel {
    // 샘플 데이터
    let emotionSample: [EmotionVariationDate] = [
        EmotionVariationDate(date: "2024-07-01", list: [
            EmotionVariationList(talk_id: 139, text: "아이는 '바보'에 대해 부정적인 반응을 보였어요.", positive: false),
            EmotionVariationList(talk_id: 140, text: "아이는 '친구랑 놀았어'라는 말에 긍정적인 반응을 보였어요.", positive: true)
        ]),
        EmotionVariationDate(date: "2024-07-02", list: [
            EmotionVariationList(talk_id: 141, text: "아이는 '혼났어'라는 말에 부정적인 반응을 보였어요.", positive: false),
            EmotionVariationList(talk_id: 142, text: "아이는 '간식 먹었어'라는 말에 긍정적인 반응을 보였어요.", positive: true)
        ]),
        EmotionVariationDate(date: "2024-07-03", list: [
            EmotionVariationList(talk_id: 143, text: "아이는 '새똥'에 대해 부정적인 반응을 보였어요.", positive: false)
        ]),
        EmotionVariationDate(date: "2024-07-04", list: [
            EmotionVariationList(talk_id: 144, text: "아이는 '선물 받았어'라는 말에 긍정적인 반응을 보였어요.", positive: true),
            EmotionVariationList(talk_id: 145, text: "아이는 '혼자 있었어'라는 말에 부정적인 반응을 보였어요.", positive: false)
        ]),
        EmotionVariationDate(date: "2024-07-05", list: [
            EmotionVariationList(talk_id: 149, text: "아이는 '새똥'에 대해 부정적인 반응을 보였어요.", positive: false),
            EmotionVariationList(talk_id: 150, text: "아이는 '예쁜 그림 그렸어'라는 말에 긍정적인 반응을 보였어요.", positive: true)
        ])
    ]
}

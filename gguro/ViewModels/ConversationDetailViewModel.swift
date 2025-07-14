//
//  ConversationDetailViewModel.swift
//  gguro
//
//  Created by 김미주 on 7/14/25.
//

import Foundation

@Observable
class ConversationDetailViewModel {
    // 샘플 데이터
    let conversationSample: [ConversationDetailModel] = [
        .init(id: 135, role: "user", content: "역할놀이 하자"),
        .init(id: 136, role: "bot", content: "좋아! 지금부터 너는 '참새', 나는 '까치'이야. 역할에 맞춰 이야기해보자!"),
        .init(id: 137, role: "user", content: "까치야 넌 왜이렇게 시끄러워?"),
        .init(id: 138, role: "bot", content: "아, 참새야! 날씨가 너무 좋아서 기분이 좋아서 그런 것 같아. 날아다니면서도 이렇게 대화할 수 있는 건 정말 재미있어! 너도 날아와보자고? "),
        .init(id: 139, role: "user", content: "까치는 바보같아"),
        .init(id: 140, role: "bot", content: "하하, 참새야! 너는 참으로 귀엽다. 날아다니면서도 이렇게 웃음이 나서 좋더라. 하지만, 날아다니기 전에 먼저 날씨를 확인해봐야겠어. 비가 오면 날아다니기 어렵지 않아? ")
    ]
}

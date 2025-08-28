//
//  LifeViewModel.swift
//  gguro
//
//  Created by 이채은 on 7/15/25.
//

import Foundation

class LifeViewModel {
    let lifeMenuList: [LifeModel] = [
        .init(title: "횡단보도", subTitle: "횡단보도는 초록불에 건너요", imageName: "icon_traffic"),
        .init(title: "뜨거운 물건", subTitle: "뜨거운 물건에 손대지 않아요", imageName: "icon_hot"),
        .init(title: "안전벨트", subTitle: "안전벨트를 꼭 매요", imageName: "icon_seatbelt"),
        .init(title: "전기 조심", subTitle: "전기 제품을 조심해요", imageName: "icon_spark"),
        .init(title: "낯선 사람", subTitle: "낯선 사람을 따라가지 않아요", imageName: "icon_stranger"),
        .init(title: "청결", subTitle: "내 몸을 깨끗하게 만들어요", imageName: "icon_wash"),
        .init(title: "양치", subTitle: "올바른 양치질을 배워요", imageName: "icon_teeth"),
        .init(title: "편식", subTitle: "음식을 골고루 먹어요", imageName: "icon_eat"),
        .init(title: "감사 표현", subTitle: "칭찬과 감사 표현을 배워요", imageName: "icon_greet"),
        .init(title: "수면", subTitle: "올바른 수면 습관을 길러요", imageName: "icon_sleep"),
        .init(title: "인사", subTitle: "다른 사람들에게 예의있게 인사해요", imageName: "icon_compliment")
    ]
}

//
//  ModalType.swift
//  gguro
//
//  Created by 김미주 on 7/15/25.
//

import Foundation

enum ModalType {
    case delete
    case withdraw
    case life(LifeModel)
    case animal(AnimalModel)
    
    var title: String {
        switch self {
        case .delete:
            return "프로필 삭제"
        case .withdraw:
            return "계정 탈퇴"
        case .life(let type):
            return type.title
        case .animal(let type):
            return type.title
        }
    }
    
    var subTitle: String {
        switch self {
        case .delete:
            return "정말 삭제하시겠습니까?\n삭제한 프로필은 복구할 수 없습니다."
        case .withdraw:
            return "정말 탈퇴하시겠습니까?\n탈퇴한 계정은 복구할 수 없습니다."
        case .life(let type):
            return type.subTitle
        case .animal(let type):
            return type.subTitle
        }
    }
    
    var leftButtonTitle: String {
        switch self {
        case .delete, .withdraw:
            return "예"
        case .life, .animal:
            return "학습하기"
        }
    }
    
    var rightButtonTitle: String {
        switch self {
        case .delete, .withdraw:
            return "아니오"
        case .life, .animal:
            return "다시 고르기"
        }
    }
}

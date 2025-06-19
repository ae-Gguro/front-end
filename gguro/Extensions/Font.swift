//
//  Font.swift
//  gguro
//
//  Created by 김미주 on 6/19/25.
//

import Foundation
import SwiftUI

extension Font {
    // MARK: - NanumSquareRound
    enum Nanum {
        case extraBold
        case bold
        case regular
        case light
        
        var value: String {
            switch self {
            case .extraBold:
                return "NanumSquareRoundOTFEB"
            case .bold:
                return "NanumSquareRoundOTFB"
            case .regular:
                return "NanumSquareRoundOTFR"
            case .light:
                return "NanumSquareRoundOTFL"
            }
        }
    }
    
    static func nanum(type: Nanum, size: CGFloat) -> Font {
        return .custom(type.value, size: size)
    }
    
    // ExtraBold
    
    static var NanumExtraBold64: Font {
        return .nanum(type: .extraBold, size: 64)
    }
    
    static var NanumExtraBold48: Font {
        return .nanum(type: .extraBold, size: 48)
    }
    
    static var NanumExtraBold45: Font {
        return .nanum(type: .extraBold, size: 45)
    }
    
    static var NanumExtraBold40: Font {
        return .nanum(type: .extraBold, size: 40)
    }
    
    static var NanumExtraBold36: Font {
        return .nanum(type: .extraBold, size: 36)
    }
    
    static var NanumExtraBold32: Font {
        return .nanum(type: .extraBold, size: 32)
    }
    
    static var NanumExtraBold28: Font {
        return .nanum(type: .extraBold, size: 28)
    }
    
    static var NanumExtraBold24: Font {
        return .nanum(type: .extraBold, size: 24)
    }
    
    static var NanumExtraBold19: Font {
        return .nanum(type: .extraBold, size: 19)
    }
    
    // Bold
    
    static var NunumBold64: Font {
        return .nanum(type: .bold, size: 64)
    }
    
    static var NanumBold48: Font {
        return .nanum(type: .bold, size: 48)
    }
    
    static var NanumBold36: Font {
        return .nanum(type: .bold, size: 36)
    }
    
    static var NanumBold20: Font {
        return .nanum(type: .bold, size: 20)
    }

    static var NanumBold18: Font {
        return .nanum(type: .bold, size: 18)
    }
    
    // MARK: - Pretendard
    enum Pretend {
        case black
        case extraBold
        case bold
        case semiBold
        case medium
        case regular
        case light
        case extraLight
        case thin
        
        var value: String {
            switch self {
            case .black:
                return "Pretendard-Black"
            case .extraBold:
                return "Pretendard-ExtraBold"
            case .bold:
                return "Pretendard-Bold"
            case .semiBold:
                return "Pretendard-SemiBold"
            case .medium:
                return "Pretendard-Medium"
            case .regular:
                return "Pretendard-Regular"
            case .light:
                return "Pretendard-Light"
            case .extraLight:
                return "Pretendard-ExtraLight"
            case .thin:
                return "Pretendard-Thin"
            }
        }
    }
    
    static func pretend(type: Pretend, size: CGFloat) -> Font {
        return .custom(type.value, size: size)
    }
    
    // SemiBold
    
    static var PretendardSemiBold128: Font {
        return .pretend(type: .semiBold, size: 128)
    }
    
    static var PretendardSemiBold32: Font {
        return .pretend(type: .semiBold, size: 32)
    }
    
    // Regular
    
    static var PretendardRegular32: Font {
        return .pretend(type: .regular, size: 32)
    }
}

//
//  Theme.swift
//  gguro
//
//  Created by 김미주 on 8/25/25.
//

import Foundation
import MarkdownUI

extension Theme {
    static let advice = Theme()
        // 문단(본문)
        .paragraph { cfg in
            cfg.label
                .markdownTextStyle {
                    FontFamily(.custom("Pretendard-Medium"))
                    FontSize(20)
                    ForegroundColor(.black1)
                }
        }
        // 헤딩 2 (##)
        .heading2 { cfg in
            cfg.label
                .markdownTextStyle {
                    FontFamily(.custom("Pretendard-SemiBold"))
                    FontSize(32)
                    ForegroundColor(.black1)
                }
        }
        // 헤딩 3 (###)
        .heading3 { cfg in
            cfg.label
                .markdownTextStyle {
                    FontFamily(.custom("Pretendard-SemiBold"))
                    FontSize(24)
                    ForegroundColor(.black1)
                }
        }
}

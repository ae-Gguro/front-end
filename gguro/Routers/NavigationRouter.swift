//
//  NavigationRouter.swift
//  gguro
//
//  Created by 김미주 on 8/23/25.
//

import Foundation
import SwiftUI
import Observation

@Observable
final class NavigationRouter<Route: Hashable> {
    var path: [Route] = []
    
    // 추가
    func push(_ route: Route) {
        path.append(route)
    }
    
    // 마지막 화면 제거
    func pop() {
        if !path.isEmpty {
            path.removeLast()
        }
    }
    
    // 초기화
    func reset() {
        path.removeAll()
    }
}

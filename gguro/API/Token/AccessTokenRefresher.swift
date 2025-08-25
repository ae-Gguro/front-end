//
//  AccessTokenRefresher.swift
//  CoreDisc
//
//  Created by 김미주 on 7/24/25.
//

import Foundation
import Alamofire

// 모든 요청 전에 accessToken 붙여줌
// 401, 404 에러 발생 시 자동으로 refreshToken 재발급 시도
class AccessTokenRefresher: @unchecked Sendable, RequestInterceptor {
    private var tokenProviding: TokenProviding
    private var isRefreshing: Bool = false
    private var requestToRetry: [(RetryResult) -> Void] = []
    
    init(tokenProviding: TokenProviding) {
        self.tokenProviding = tokenProviding
    }
    
    func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, any Error>) -> Void) {
        var urlRequest = urlRequest
        if let accessToken = tokenProviding.accessToken {
            urlRequest.setValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
        }
        completion(.success(urlRequest))
    }
    
    func retry(_ request: Request, for session: Session, dueTo error: any Error, completion: @escaping (RetryResult) -> Void) {
        print("🍎 리트라이 진입했어요!!!!!! 🍎")
        guard request.retryCount < 1,
              let response = request.task?.response as? HTTPURLResponse,
              [401, 404].contains(response.statusCode) else {
            return completion(.doNotRetry)
        }
        
        requestToRetry.append(completion)
        if !isRefreshing {
            isRefreshing = true
            tokenProviding.refreshToken { [weak self] newToken, error in
                guard let self = self else { return }
                self.isRefreshing = false
                let result = error == nil ? RetryResult.retry : RetryResult.doNotRetryWithError(error!)
                self.requestToRetry.forEach { $0(result) }
                self.requestToRetry.removeAll()
            }
        }
    }
}

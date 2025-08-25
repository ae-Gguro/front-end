//
//  AppDelegate.swift
//  gguro
//
//  Created by 김미주 on 8/23/25.
//

import UIKit
import UserNotifications
import FirebaseCore
import FirebaseMessaging
import Moya

// AppDelegate: SwiftUI 앱에서 UIApplicationDelegate를 활용하기 위한 클래스
class AppDelegate: NSObject, UIApplicationDelegate, UNUserNotificationCenterDelegate {
    
    // 앱이 실행될 때 최초로 호출되는 메서드
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        // UNUserNotificationCenter의 델리게이트 설정 (포그라운드 알림 수신을 위해 필요)
        UNUserNotificationCenter.current().delegate = self
        
        // Firebase 초기화
        FirebaseApp.configure()
        
        // 사용자에게 알림 권한 요청
        requestNotificationPermission()
        
        // 원격 푸시 알림 등록 요청 (APNs)
        application.registerForRemoteNotifications()
        
        // Firebase Messaging 델리게이트 설정
        Messaging.messaging().delegate = self
        
        return true
    }
    
    // 알림 권한 요청 함수
    private func requestNotificationPermission() {
        let center = UNUserNotificationCenter.current()
        // 화면에 알림 배너 표시, 앱 아이콘에 빨간 뱃지, 알림 도착 시 소리 설정 관련 처리
        center.requestAuthorization(options: [.alert, .badge, .sound]) { granted, error in
            if granted {
                // 권한이 승인되면 원격 알림 등록
                DispatchQueue.main.async {
                    UIApplication.shared.registerForRemoteNotifications()
                }
            }
        }
    }
    
    // APNs로부터 디바이스 토큰을 성공적으로 수신했을 때 호출됨
    func application(_ application: UIApplication,
                     didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        
        // 디바이스 토큰을 16진수 문자열로 변환하여 출력
        let tokenString = deviceToken.map { String(format: "%02x", $0) }.joined()
        print("APNs 디바이스 토큰: \(tokenString)")
        
        // Firebase Messaging에 APNs 토큰 전달 (FCM이 푸시 전송에 사용)
        Messaging.messaging().apnsToken = deviceToken
        
        // NotificationCenter를 통해 앱 내 다른 객체에게 토큰 전달 (옵셔널)
        NotificationCenter.default.post(name: .deviceTokenReceived, object: tokenString)
    }
    
    // APNs 등록 실패 시 호출됨
    func application(_ application: UIApplication,
                     didFailToRegisterForRemoteNotificationsWithError error: any Error) {
        print("푸시 등록 실패: \(error.localizedDescription)")
    }
    
    // 앱이 포그라운드 상태일 때 푸시 알림이 도착하면 호출됨
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                willPresent notification: UNNotification,
                                withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        
        print("포그라운드에서 푸시 수신: \(notification.request.content.userInfo)")
        
        // 알림을 배너 + 사운드 + 뱃지로 표시
        completionHandler([.banner, .sound, .badge])
    }
}

// MARK: - Firebase MessagingDelegate
extension AppDelegate: MessagingDelegate {
    
    // FCM 등록 토큰 수신 시 호출됨 (앱 최초 실행, 또는 토큰 갱신 시)
    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {
        guard let fcmToken = fcmToken else { return }
        
        // 콘솔에 FCM 토큰 출력
        print("FCM 등록 토큰 수신: \(fcmToken)")
        
        // 토큰 저장
        KeychainManager.standard.saveString(fcmToken, for: "FCMToken")
        print("=== FCM 토큰 키체인 저장 성공 ===")
    }
}

// MARK: - NotificationCenter 알림 이름 정의
extension Notification.Name {
    /// 디바이스 토큰 수신 시 NotificationCenter를 통해 전달
    static let deviceTokenReceived = Notification.Name("deviceTokenReceived")
}

//
//  RoleplayContentView.swift
//  gguro
//
//  Created by 이채은 on 7/15/25.
//

import SwiftUI

struct RoleplayContentView: View {
    @ObservedObject var ws: WebSocketManager

    var body: some View {
        VStack {
            // 상태 디버그 확인용 라벨
            Text("DEBUG: \(String(describing: ws.state)) v\(ws.stateVersion)")
                .foregroundColor(.red)

            switch ws.state {
            case .intro(let name):
                RoleplayIntroView(name: name)
            case .confirm(let user, let bot):
                RoleplayConfirmView(userRole: user, botRole: bot)
            case .started(let reply):
                RoleplayStartView(reply: reply)
            case .listening:
                ListeningView()
            case .thinking:
                ThinkingView()
            case .ended:
                RoleplayEndedView()
            }
        }
        // stateVersion이 바뀔 때마다 강제 리렌더링
        .id(ws.stateVersion)
    }
}

struct RolePlayScreen: View {
    @Environment(\.childNameAYA) private var childName
    @StateObject private var ws = WebSocketManager()

    var body: some View {
        BlackBoardLayout(type: .wordQuiz(name: childName)) {
            RoleplayContentView(ws: ws)
        }
        .onAppear {
            let pid = UserDefaults.standard.integer(forKey: "profileId")
            if pid > 0 {
                startRoleplay(profileId: pid)
                ws.connect(childName: childName)
            } else {
                print("[ERROR] 저장된 profileId 없음")
            }
        }
        .onDisappear { ws.disconnect() }
        .navigationBarBackButtonHidden(true)
    }

    // 역할놀이 세션 시작
    private func startRoleplay(profileId: Int) {
        Task {
            guard let url = URL(string: "http://172.20.10.3:8787/start/roleplay") else { return }

            var req = URLRequest(url: url)
            req.httpMethod = "POST"
            req.setValue("application/json", forHTTPHeaderField: "Content-Type")

            if let session = KeychainManager.standard.loadSession(for: "appNameUser"),
               let token = session.accessToken {
                req.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")

                let body: [String: Any] = [
                    "profile_id": profileId,
                    "session_id": "\(profileId)_역할놀이",
                    "access_token": token
                ]
                req.httpBody = try? JSONSerialization.data(withJSONObject: body)

                do {
                    let (data, resp) = try await URLSession.shared.data(for: req)
                    if let httpResp = resp as? HTTPURLResponse {
                        print("[ROLEPLAY START] status=\(httpResp.statusCode)")
                    }
                    print("[ROLEPLAY START] \(String(data: data, encoding: .utf8) ?? "")")
                } catch {
                    print("[ROLEPLAY ERROR] \(error)")
                }
            }
        }
    }
}

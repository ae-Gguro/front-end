//
//  ConversationContentView.swift
//  gguro
//
//  Created by 이채은 on 7/14/25.
//

import SwiftUI

struct ConversationContentView: View {
    @EnvironmentObject var ws: AIChatWebSocketManager
    
    var body: some View {
        VStack {
            switch ws.state {
            case .intro:
                ConversationIntroView()
            case .listening:
                ListeningView()
            case .thinking:
                ThinkingView()
            case .ended:
                ConversationEndedView()
            }
        }
        .onChange(of: ws.state) { newValue in
                    print("[VIEW] 상태 변경 감지: \(newValue)")
                }
    }
}




struct AIChatScreen: View {
    @Environment(\.childNameAYA) private var childName
    @StateObject private var ws = AIChatWebSocketManager()

    var body: some View {
        BlackBoardLayout(type: .aiChat(name: childName)) {
            ConversationContentView()
                
        }
        .environmentObject(ws)
        .onAppear {
            ws.connect()
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {   // ⏳ 연결 보장 후 호출
                let pid = UserDefaults.standard.integer(forKey: "profileId")
                if pid > 0 {
                    startConversation(profileId: pid)
                } else {
                    print("[ERROR] 저장된 profileId 없음")
                }
            }
        }


        .onDisappear {
            ws.disconnect()
        }
        .navigationBarBackButtonHidden(true)
    }

    private func startConversation(profileId: Int) {
        print("[DEBUG] startConversation called with pid=\(profileId)")
        Task {
            guard let url = URL(string: "http://172.20.10.3:8787/start/conversation") else { return }
            var req = URLRequest(url: url)
            req.httpMethod = "POST"
            req.setValue("application/json", forHTTPHeaderField: "Content-Type")

            if let session = KeychainManager.standard.loadSession(for: "appNameUser"),
               let token = session.accessToken {
                req.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")

                let body: [String: Any] = [
                    "profile_id": profileId,
                    "session_id": "\(profileId)_일상대화",
                    "access_token": token
                ]
                req.httpBody = try? JSONSerialization.data(withJSONObject: body)
                print("[DEBUG] request body=\(body)")
            }

            do {
                let (data, resp) = try await URLSession.shared.data(for: req)
                if let httpResp = resp as? HTTPURLResponse {
                    print("[CONVERSATION START] status=\(httpResp.statusCode)")
                }
                print("[CONVERSATION START] \(String(data: data, encoding: .utf8) ?? "")")
            } catch {
                print("[CONVERSATION ERROR] \(error)")
            }
        }
    }
}



#Preview {
    AIChatScreen()
}

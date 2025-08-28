//
//  WebSocketManager.swift
//  gguro
//
//  Created by 이채은 on 8/28/25.
//

import Foundation
import SocketIO

class WebSocketManager: ObservableObject {
    @Published var state: RoleplayState = .intro(name: "아이")
    @Published var stateVersion: Int = 0   // 상태 강제 리프레시용

    private var manager: SocketManager!
    private var socket: SocketIOClient!

    func connect(childName: String) {
        guard let url = URL(string: "http://172.20.10.3:8787") else { return }

        manager = SocketManager(
            socketURL: url,
            config: [
                .log(true),
                .compress,
                .reconnects(true),
                .reconnectWait(10)
                // .forceWebsockets(true)  제거
            ]
        )

        socket = manager.defaultSocket

        // ===== 연결 이벤트 =====
        socket.on(clientEvent: .connect) { _, _ in
            print("[SOCKET] connected")
        }

        socket.on(clientEvent: .error) { data, _ in
            print("[SOCKET ERROR] \(data)")
        }

        // ===== 서버 이벤트 =====
        socket.on("ask_roles") { _, _ in
            print("[WS EVENT] ask_roles")
            DispatchQueue.main.async {
                self.state = .intro(name: childName)
                self.stateVersion += 1
            }
        }

        socket.on("confirm_roles") { data, _ in
            print("[WS EVENT] confirm_roles \(data)")
            if let dict = data.first as? [String: Any] {
                let ur = dict["user_role"] as? String ?? "아이"
                let br = dict["bot_role"] as? String ?? "꾸로"
                DispatchQueue.main.async {
                    self.state = .confirm(user: ur, bot: br)
                    self.stateVersion += 1
                }
            }
        }

        socket.on("listening") { _, _ in
            print("[WS EVENT] listening")
            DispatchQueue.main.async {
                self.state = .listening
                self.stateVersion += 1
            }
        }

        socket.on("thinking") { _, _ in
            print("[WS EVENT] thinking")
            DispatchQueue.main.async {
                self.state = .thinking
                self.stateVersion += 1
            }
        }

        socket.on("reply") { data, _ in
            print("[WS EVENT] reply \(data)")
            if let dict = data.first as? [String: Any],
               let reply = dict["text"] as? String {
                DispatchQueue.main.async {
                    self.state = .started(reply: reply)
                    self.stateVersion += 1
                }
            }
        }

        socket.on("ended") { _, _ in
            print("[WS EVENT] ended")
            DispatchQueue.main.async {
                self.state = .ended
                self.stateVersion += 1
            }
        }

        socket.on("error") { data, _ in
            print("[WS ERROR EVENT] \(data)")
        }

        // ===== 연결 시작 =====
        socket.connect()
    }

    func disconnect() {
        socket.disconnect()
    }

    func sendConfirm(isYes: Bool) {
        socket.emit("confirm_response", ["answer": isYes ? "yes" : "no"])
    }
}

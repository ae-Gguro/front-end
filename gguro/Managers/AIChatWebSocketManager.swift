import Foundation
import SocketIO

final class AIChatWebSocketManager: ObservableObject {
    private var manager: SocketManager
    private var socket: SocketIOClient

    @Published var state: AIChatState = .intro
    @Published private(set) var isConnected: Bool = false

    init() {
        let url = URL(string: "http://172.20.10.3:8787")!
        manager = SocketManager(
            socketURL: url,
            config: [
                .log(true),
                .compress,
                .reconnects(true),             // 끊어지면 자동 재연결
                .reconnectAttempts(-1),        // 무한 재시도
                .reconnectWait(2),             // 2초 간격
                .forceWebsockets(true),        // 반드시 WebSocket 사용 (polling 안 씀)
                .forceNew(true),               // 새 세션 강제
                .connectParams([
                    "EIO": "4", 
                    "transport": "websocket"   // 서버랑 통일
                ])
            ]
        )



        socket = manager.defaultSocket
        addHandlers()
    }
    
    func connect() {
        switch socket.status {
        case .connected, .connecting:
            print("[WS] 이미 연결중: \(socket.status)")
            return
        default:
            print("[WS] 연결 시도 (현재 상태: \(socket.status))")
            socket.connect()
        }
    }


    func disconnect() {
        socket.disconnect()
        isConnected = false
        print("[WS] 연결 해제")
    }

    private func addHandlers() {
        socket.on(clientEvent: .connect) { [unowned self] _, _ in
            print("[WS] 연결 성공")
            DispatchQueue.main.async {
                self.isConnected = true
            }
        }

        socket.on(clientEvent: .disconnect) { [unowned self] _, _ in
            print("[WS] 연결 해제됨")
            DispatchQueue.main.async {
                self.isConnected = false
            }
        }

        // 서버 이벤트
        socket.on("ready") { [unowned self] data, _ in
            print("[WS] ready 이벤트 수신: \(data)")
            DispatchQueue.main.async {
                self.state = .intro   // ✅ 상태를 명시적으로 바꿔줘야 함
            }
        }


        socket.on("listening") { [unowned self] data, _ in
            print("[WS] listening 이벤트 수신: \(data)")
            DispatchQueue.main.async {
                self.state = .listening
            }
        }



        socket.on("thinking") { [unowned self] _, _ in
            print("[WS] thinking 이벤트 수신")
            DispatchQueue.main.async {
                self.state = .thinking
            }
        }

        socket.on("ended") { [unowned self] _, _ in
            print("[WS] ended 이벤트 수신")
            DispatchQueue.main.async {
                self.state = .ended
            }
        }
    }
}


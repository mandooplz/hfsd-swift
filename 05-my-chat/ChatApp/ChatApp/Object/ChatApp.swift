//
//  ChatApp.swift
//  ChatApp
//
//  Created by 김민우 on 11/4/25.
//
import Foundation
import Observation
import SwiftLogger
import Collections

private let logger = SwiftLogger("ChatApp")


// MARK: Object
@MainActor @Observable
final class ChatApp: Sendable {
    // MARK: core
    init() { }


    // MARK: state
    let serverFlow = ChatServerFlow.shared
    let clientId = UUID() // 객체마다 고유함
    
    var signInForm: SignInForm? = nil
    var signUpForm: SignUpForm? = nil
    var credential: Credential? = nil
    
    private var newMsgEvents: Deque<NewMsgEvent> = []
    func addMsgEvent(_ event: NewMsgEvent) {
        self.newMsgEvents.append(event)
    }
    
    private var messages: Set<Message> = []
    var sortedMessages: [Message] {
        return messages.sorted(using: SortDescriptor(\.createdAt))
    }
    
    var messageInput: String = ""
    
    private(set) var isSubscribed: Bool = false //
    
    
    // MARK: action
    func setUp() async {
        logger.start()
        
        // capture
        guard signInForm == nil, signUpForm == nil else {
            logger.error("이미 SetUp 완료된 상태입니다.")
            return
        }
        
        // mutate
        self.signInForm = SignInForm(owner: self)
        self.signUpForm = SignUpForm(owner: self)
    }
    
    func fetchMessages() async {
        logger.start()
        
        // capture
        guard let credential else {
            logger.error("현재 로그인되지 않은 상태입니다. SignInForm을 통해 로그인 과정이 먼저 필요합니다.")
            return
        }
        
        do {
            // compute
            let newMessages = try await serverFlow.getMessages(credential: credential)
            
            // mutate
            self.messages = Set(newMessages)
        } catch {
            logger.error(error)
            return
        }
    }
    
    func processMsgEvents() async {
        // mutate
        while !newMsgEvents.isEmpty {
            let newMsgEvent = newMsgEvents.removeFirst()
            
            let newMessgae = Message(senderEmail: newMsgEvent.senderEmail,
                                     content: newMsgEvent.content,
                                     createdAt: .now)
            self.messages.insert(newMessgae)
        }
    }
//    func subscribeServer() async {
//        logger.start()
//        
//        // capture
//        guard isSubscribed == false else {
//            logger.info("Already subscribed to server")
//            return
//        }
//        guard credential != nil else {
//            logger.error("Credential missing; subscription aborted")
//            return
//        }
//        
//        do {
//            // compute
//            try await serverFlow.subscribe(
//                clientId: clientId,
//                onText: { [weak self] textData in
//                    // newMsg 이벤트 시 실행할 Flow
//                    Task {
//                        await self?.handleWebSocketText(textData)
//                    }
//                },
//                onClose: { [weak self] error in
//                    // close 이벤트시 실행할 Flow
//                    if let error {
//                        logger.error("WebSocket closed with error: \(error.localizedDescription)")
//                    } else {
//                        logger.info("WebSocket closed normally")
//                    }
//                    
//                    Task { @MainActor [weak self] in
//                        self?.isSubscribed = false
//                    }
//                }
//            )
//            
//            // mutate
//            isSubscribed = true
//        } catch {
//            logger.error("Failed to subscribe: \(error.localizedDescription)")
//            isSubscribed = false
//            return
//        }
//    }
    func sendMessage() async {
        logger.start()
        
        // capture
        let trimmed = messageInput.trimmingCharacters(in: .whitespacesAndNewlines)
        guard trimmed.isEmpty == false else {
            logger.error("messageInput이 빈 값입니다.")
            return
        }
        guard let credential else {
            logger.error("메시지를 보내기 위한 Credential이 존재하지 않습니다.")
            return
        }
        
        
        do {
            // compute
            let ticket = NewMsgTicket(client: clientId,
                                      credential: credential,
                                      content: trimmed)
            try await serverFlow.addMessage(ticket: ticket)
            
            // mutate
            self.messageInput = ""
        } catch {
            logger.error(error)
        }
        
        logger.end()
    }

    private func handleWebSocketText(_ text: String) async {
        guard let data = text.data(using: .utf8) else {
            logger.error("웹소켓 메시지를 Data로 변환할 수 없습니다: \(text)")
            return
        }

        do {
            _ = try JSON.decoder.decode(NewMsgEvent.self, from: data)
            await fetchMessages()
        } catch {
            logger.error("서버에서 받은 메시지: \(text)")
        }
    }
}

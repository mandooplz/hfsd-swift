//
//  NewMsgEvent.swift
//  ChatServer
//
//  Created by 김민우 on 11/4/25.
//
import Foundation


// MARK: Value
public struct NewMsgEvent: Sendable, Hashable, Codable {
    public let id: UUID
    public let client: UUID // 전송자의 ClientID
    public let senderEmail: String
    public let content: String
    
    public init(id: UUID = UUID(), client: UUID, senderEmail: String, content: String) {
        self.id = id
        self.client = client
        self.senderEmail = senderEmail
        self.content = content
    }
}

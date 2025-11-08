//
//  Message.swift
//  ChatApp
//
//  Created by 김민우 on 11/4/25.
//
import Foundation


// MARK: value
nonisolated public struct Message: Sendable, Hashable, Codable {
    public let id: UUID
    public let senderEmail: String
    public let content: String
    public let createdAt: Date
    
    public init(id: UUID = UUID(), senderEmail: String, content: String, createdAt: Date) {
        self.id = id
        self.senderEmail = senderEmail
        self.content = content
        self.createdAt = createdAt
    }
}

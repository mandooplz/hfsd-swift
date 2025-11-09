//
//  NewMsgTicket.swift
//  ChatServer
//
//  Created by 김민우 on 11/4/25.
//
import Foundation


// MARK: Value
public struct NewMsgTicket: Sendable, Hashable, Codable {
    // MARK: core
    public let id: UUID
    public let client: UUID
    public let credential: Credential
    public let content: String
    
    public init(id: UUID = UUID(), client: UUID, credential: Credential, content: String) {
        self.id = id
        self.client = client
        self.credential = credential
        self.content = content
    }
}

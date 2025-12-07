//
//  MyMessage.swift
//  Cheetos
//
//  Created by 김민우 on 8/28/25.
//
import Foundation


// MARK: Object
@MainActor @Observable
public final class MyMessage: MessageInterface {
    // MARK: core
    internal init(owner: Cheetos, content: String) {
        self.owner = owner
        self.content = content
    }
    
    
    // MARK: state
    public nonisolated let id = UUID()
    internal weak var owner: Cheetos?
    
    public var content: String? = nil
    public nonisolated let createdAt: Date? = .now
    
    public var isLoading: Bool = false
    public nonisolated let isMyMessage: Bool = true
    
    
    // MARK: action
}

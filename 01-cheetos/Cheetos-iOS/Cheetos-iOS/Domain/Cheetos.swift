//
//  Cheetos.swift
//  Cheetos
//
//  Created by 김민우 on 8/28/25.
//
import Foundation


// MARK: Object
@MainActor @Observable
public final class Cheetos: Sendable {
    // MARK: core
    public init() { }
    
    
    // MARK: state
    public nonisolated let id = UUID()
    
    public var textInput: String = ""
    
    public var messages: [any MessageInterface] = []
    
    
    // MARK: action
    public func newFortune() async {
        // mutate
        let fortureRef = Fortune(owner: self)
        self.messages.append(fortureRef)
    }
    public func newAdvice() async {
        // capture
        fatalError()
    }
    
    public func createMyMessage() async {
        // capture
        let textInput = self.textInput
        
        // mutate
        let myMessageRef = MyMessage(owner: self, content: textInput)
        self.messages.append(myMessageRef)
    }
}

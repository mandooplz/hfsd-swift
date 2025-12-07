//
//  Message.swift
//  Cheetos
//
//  Created by 김민우 on 8/28/25.
//
import Foundation


// MARK: Interface
@MainActor
public protocol MessageInterface: Sendable {
    var content: String? { get }
    var createdAt: Date? { get }
    
    var isMyMessage: Bool { get }
    var isLoading: Bool { get }
}

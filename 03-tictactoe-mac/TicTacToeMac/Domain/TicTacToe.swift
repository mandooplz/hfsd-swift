//
//  TicTacToe.swift
//  TicTacToe
//
//  Created by 김민우 on 7/30/25.
//
import Foundation


// MARK: Object
@MainActor @Observable
public final class TicTacToe {
    // MARK: core
    public init() { }
    
    // MARK: state
    nonisolated let id = ID()
    
    public internal(set) var boards: [GameBoard] = []
    public func getBoard(id: GameBoard.ID) -> GameBoard? {
        self.boards
            .first { $0.id == id }
    }
    public var boardList: [GameBoard] {
        boards
            .sorted { $0.createdAt < $1.createdAt }
    }
    public var boardCount: Int {
        boards.count
    }
    
    public var selectedBoard: GameBoard.ID? = nil
    
    
    // MARK: action
    public func createGame() async {
        // mutate
        let gameBoard = GameBoard(owner: self)
        
        self.boards.append(gameBoard)
    }
    
    
    // MARK: value
    public nonisolated struct ID: Sendable, Hashable, Identifiable {
        public let id: UUID
        nonisolated init(_ id: UUID = UUID()) {
            self.id = id
        }
    }
    
    public nonisolated struct ObjectIssue: Sendable, Hashable, Identifiable {
        public let id = UUID()
        public let reason: String
        
        public init(_ reason: String) {
            self.reason = reason
        }
    }
    
    internal typealias Callback = @Sendable () async -> Void
    
    public enum Error: String, Swift.Error {
        case tictactoeIsDeleted
    }
}



// MARK: ObjectManager
@MainActor @Observable
fileprivate final class TicTacToeManager {
    // MARK: state
    static var container: [TicTacToe.ID: TicTacToe] = [:]
    static func register(_ object: TicTacToe) {
        container[object.id] = object
    }
    static func unregister(_ id: TicTacToe.ID) {
        container[id] = nil
    }
}

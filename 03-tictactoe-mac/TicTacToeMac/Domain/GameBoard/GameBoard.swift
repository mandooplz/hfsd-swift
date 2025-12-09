//
//  GameBoard.swift
//  TicTacToe
//
//  Created by 김민우 on 7/30/25.
//
import Foundation


// MARK: Object
@MainActor @Observable
public final class GameBoard {
    // MARK: core
    init(owner: TicTacToe) {
        self.owner = owner
    }
    
    // MARK: state
    public nonisolated let id = ID()
    weak var owner: TicTacToe?
    
    public nonisolated let createdAt: Date = .now

    public internal(set) var currentPlayer: Player = .X
    internal func changePlayer() {
        switch currentPlayer {
        case .X:
            self.currentPlayer = .O
        case .O:
            self.currentPlayer = .X
        }
    }
    
    public internal(set) var cards: [GameCard] = []
    internal func getCard(_ position: CardPosition) -> GameCard? {
        self.cards
            .first {
                $0.position == position
            }
    }
    internal var XPositions: Set<CardPosition> {
        let positions = self.cards
            .filter { $0.player == .X }
            .map { $0.position }
        
        return Set(positions)
    }
    internal var OPositions: Set<CardPosition> {
        let positions = self.cards
            .filter { $0.player == .O }
            .map { $0.position }
        
        return Set(positions)
    }
    
    public var isEnd: Bool = false
    public var result: GameResult?
    
    
    // MARK: action
    public func setUp() async {
        // capture
        guard self.cards.isEmpty else {
            print(#file, #line, #function, "이미 setUp된 상태입니다.")
            return
        }
        
        // process
        let positions = (0..<9).map { CardPosition($0) }
        
        
        // mutate
        for position in positions {
            let gameCard = GameCard(
                owner: self,
                position: position
            )
            
            self.cards.append(gameCard)
        }
    }
    
    public func removeBoard() async {
        // capture
        let tictactoe = self.owner!
        
        // mutate
        tictactoe.boards.removeAll { $0.id == self.id }
    }

    
    // MARK: value
    public nonisolated struct ID: Sendable, Hashable, Identifiable {
        public let id: UUID
        nonisolated init(_ id: UUID = UUID()) {
            self.id = id
        }
    }
    
    public nonisolated enum Player: String, Sendable, Hashable {
        case X, O
        
        internal func getOponent() -> Player {
            switch self {
            case .X:
                return .O
            case .O:
                return .X
            }
        }
    }
    
    public nonisolated enum GameResult: Sendable, Hashable {
        case draw
        case win(Player)
    }
    
    public nonisolated struct CardPosition: Sendable, Hashable {
        let rawValue: Int
        init(_ rawValue: Int) {
            self.rawValue = rawValue
        }
    }
}

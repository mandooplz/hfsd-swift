//
//  GameCard.swift
//  TicTacToe
//
//  Created by 김민우 on 7/30/25.
//
import Foundation


// MARK: Object
@MainActor @Observable
public final class GameCard {
    // MARK: core
    init(owner: GameBoard, position: GameBoard.CardPosition) {
        self.owner = owner
        self.position = position
    }
    
    // MARK: state
    public nonisolated let id = ID()
    weak var owner: GameBoard?
    
    nonisolated let winPositions: [Set<GameBoard.CardPosition>] = [
        [.init(0), .init(1), .init(2)],
        [.init(3), .init(4), .init(5)],
        [.init(6), .init(7), .init(8)],
        [.init(0), .init(3), .init(6)],
        [.init(1), .init(4), .init(7)],
        [.init(2), .init(5), .init(8)],
        [.init(0), .init(4), .init(8)],
        [.init(2), .init(4), .init(6)]
    ]
    
    public nonisolated let position: GameBoard.CardPosition
    public var player: GameBoard.Player?
    
    
    // MARK: action
    public func select() async {
        // capture
        guard self.player == nil else {
            print("이미 선택된 Card입니다.")
            return
        }
        let gameBoardRef = self.owner!
        
        // mutate
        guard gameBoardRef.isEnd == false else {
            print("game이 종료되어 취소됩니다.")
            return
        }
        self.player = gameBoardRef.currentPlayer
        gameBoardRef.changePlayer()
        
        for winPosition in winPositions {
            if winPosition.isSubset(of: gameBoardRef.XPositions) {
                gameBoardRef.isEnd = true
                gameBoardRef.result = .win(.X)
                break
            }
            
            if winPosition.isSubset(of: gameBoardRef.OPositions) {
                gameBoardRef.isEnd = true
                gameBoardRef.result = .win(.O)
                break
            }
        }
        
        if gameBoardRef.isEnd == false && (gameBoardRef.XPositions.count + gameBoardRef.OPositions.count == 9) {
            gameBoardRef.isEnd = true
            gameBoardRef.result = .draw
        }
    }

    
    // MARK: value
    public nonisolated struct ID: Sendable, Hashable, Identifiable {
        public let id: UUID
        nonisolated init(_ id: UUID = UUID()) {
            self.id = id
        }
    }
}


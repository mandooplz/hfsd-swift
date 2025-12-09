//
//  GameBoardTests.swift
//  TicTacToe
//
//  Created by 김민우 on 7/30/25.
//
import Foundation
import Testing
@testable import TicTacToeMac


// MARK: Tests
@Suite("GameBoard")
struct GameBoardTests {
    struct SetUp {
        let tictactoe: TicTacToe
        let gameBoard: GameBoard
        init() async throws {
            self.tictactoe = await TicTacToe()
            self.gameBoard = try await getGameBoard(tictactoe)
        }
        
        @Test func whenAlreadySetUp() async throws {
            // given
            await gameBoard.setUp()
            
            try await #require(gameBoard.cards.isEmpty == false)
            
            let oldCards = await gameBoard.cards
            
            // when
            await gameBoard.setUp()
            
            // then
            let cards = await gameBoard.cards
            
            let oldCardIds = oldCards.map { $0.id }
        }
        
        @Test func createNineGameCards() async throws {
            // given
            try await #require(gameBoard.cards.isEmpty == true)
            
            // when
            await gameBoard.setUp()
            
            // then
            await #expect(gameBoard.cards.count == 9)
        }
    }
    
    struct RemoveBoard {
        let tictactoe: TicTacToe
        let gameBoard: GameBoard
        init() async throws {
            self.tictactoe = await TicTacToe()
            self.gameBoard = try await getGameBoard(tictactoe)
        }
        
        @Test func TicTacToe_deleteBoard() async throws {
            // given
            let gameBoardId = gameBoard.id
            
            try await #require(tictactoe.getBoard(id: gameBoardId) != nil)
            
            // when
            await gameBoard.removeBoard()
            
            // then
            await #expect(tictactoe.getBoard(id: gameBoardId) == nil)
        }
    }
}



// MARK: Helphers
private func getGameBoard(_ tictactoeRef: TicTacToe) async throws -> GameBoard {
    // create GameBoard
    try await #require(tictactoeRef.boards.isEmpty)
    
    await tictactoeRef.createGame()
    
    try await #require(tictactoeRef.boards.count == 1)
    
    let gameBoard = try #require(await tictactoeRef.boards.first)
    return gameBoard
}

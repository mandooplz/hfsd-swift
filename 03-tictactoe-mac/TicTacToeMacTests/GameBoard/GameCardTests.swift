//
//  GameCardTests.swift
//  TicTacToe
//
//  Created by 김민우 on 7/30/25.
//
import Foundation
import Testing
@testable import TicTacToeMac


// MARK: Tests
@Suite("GameCard")
struct GameCardTests {
    struct Select {
        let tictactoe: TicTacToe
        let gameCard: GameCard
        let gameBoard: GameBoard
        init() async throws {
            self.tictactoe = await TicTacToe()
            self.gameCard = try await getGameCard(tictactoe)
            self.gameBoard = try #require(await gameCard.owner)
        }
        
        @Test func whenGameBoardIsEndedTrue() async throws {
            // given
            await MainActor.run {
                gameBoard.isEnd = true
            }
            
            let oldPlayer = await gameCard.player
            
            // when
            await gameCard.select()
            
            // then
            await #expect(gameCard.player == oldPlayer)
        }
        
        @Test func setPlayerToCurrenyPlayer() async throws {
            // given
            try await #require(gameBoard.isEnd == false)
            let currentPlayer = await gameBoard.currentPlayer
            
            try await #require(gameCard.player == nil)
            
            // when
            await gameCard.select()
            
            // then
            await #expect(gameCard.player == currentPlayer)
        }
        @Test func whenAlreadySelected() async throws {
            // given
            await gameCard.select()
            
            let oldPlayer = try #require(await gameCard.player)
            
            // when
            await gameCard.select()
            
            // then
            await #expect(gameCard.player == oldPlayer)
        }
        
        @Test func GameBoard_toggleCurrentPlayer() async throws {
            // given
            let currentPlayer = await gameBoard.currentPlayer
            
            let anotherPlayer = currentPlayer.getOponent()
            
            // when
            await gameCard.select()
            
            // then
            await #expect(gameBoard.currentPlayer == anotherPlayer)
        }
        
        @Test func whenXWin_012() async throws {
            // given
            let gameCardRef_0 = try #require(await gameBoard.getCard(.init(0)))
            let gameCardRef_1 = try #require(await gameBoard.getCard(.init(1)))
            let gameCardRef_2 = try #require(await gameBoard.getCard(.init(2)))
            let gameCardRef_3 = try #require(await gameBoard.getCard(.init(3)))
            let gameCardRef_4 = try #require(await gameBoard.getCard(.init(4)))
            
            try await #require(gameBoard.currentPlayer == .X)
            
            try await #require(gameBoard.XPositions.isEmpty)
            try await #require(gameBoard.OPositions.isEmpty)
            
            try await #require(gameBoard.result == nil)
            try await #require(gameBoard.isEnd == false)
            
            // when
            await gameCardRef_0.select()
            await gameCardRef_3.select()
            await gameCardRef_1.select()
            await gameCardRef_4.select()
            await gameCardRef_2.select()
            
            // then
            await #expect(gameBoard.isEnd == true)
            await #expect(gameBoard.result == .win(.X))
        }
        @Test func whenXWin_345() async throws {
            // given
            let gameCardRef_0 = try #require(await gameBoard.getCard(.init(0)))
            let gameCardRef_1 = try #require(await gameBoard.getCard(.init(1)))
            let gameCardRef_3 = try #require(await gameBoard.getCard(.init(3)))
            let gameCardRef_4 = try #require(await gameBoard.getCard(.init(4)))
            let gameCardRef_5 = try #require(await gameBoard.getCard(.init(5)))
            
            // when
            await gameCardRef_3.select()
            await gameCardRef_0.select()
            await gameCardRef_4.select()
            await gameCardRef_1.select()
            await gameCardRef_5.select()
            
            // then
            await #expect(gameBoard.isEnd == true)
            await #expect(gameBoard.result == .win(.X))
        }
        @Test func whenXWin_678() async throws {
            // given
            let gameCardRef_0 = try #require(await gameBoard.getCard(.init(0)))
            let gameCardRef_1 = try #require(await gameBoard.getCard(.init(1)))
            let gameCardRef_6 = try #require(await gameBoard.getCard(.init(6)))
            let gameCardRef_7 = try #require(await gameBoard.getCard(.init(7)))
            let gameCardRef_8 = try #require(await gameBoard.getCard(.init(8)))
            
            // when
            await gameCardRef_6.select()
            await gameCardRef_0.select()
            await gameCardRef_7.select()
            await gameCardRef_1.select()
            await gameCardRef_8.select()
            
            // then
            await #expect(gameBoard.isEnd == true)
            await #expect(gameBoard.result == .win(.X))
        }
        @Test func whenXWin_036() async throws {
            // given
            let gameCardRef_0 = try #require(await gameBoard.getCard(.init(0)))
            let gameCardRef_1 = try #require(await gameBoard.getCard(.init(1)))
            let gameCardRef_3 = try #require(await gameBoard.getCard(.init(3)))
            let gameCardRef_4 = try #require(await gameBoard.getCard(.init(4)))
            let gameCardRef_6 = try #require(await gameBoard.getCard(.init(6)))
            
            // when
            await gameCardRef_0.select()
            await gameCardRef_1.select()
            await gameCardRef_3.select()
            await gameCardRef_4.select()
            await gameCardRef_6.select()
            
            // then
            await #expect(gameBoard.isEnd == true)
            await #expect(gameBoard.result == .win(.X))
        }
        @Test func whenXWin_147() async throws {
            // given
            let gameCardRef_0 = try #require(await gameBoard.getCard(.init(0)))
            let gameCardRef_1 = try #require(await gameBoard.getCard(.init(1)))
            let gameCardRef_3 = try #require(await gameBoard.getCard(.init(3)))
            let gameCardRef_4 = try #require(await gameBoard.getCard(.init(4)))
            let gameCardRef_7 = try #require(await gameBoard.getCard(.init(7)))
            
            // when
            await gameCardRef_1.select()
            await gameCardRef_0.select()
            await gameCardRef_4.select()
            await gameCardRef_3.select()
            await gameCardRef_7.select()
            
            // then
            await #expect(gameBoard.isEnd == true)
            await #expect(gameBoard.result == .win(.X))
        }
        @Test func whenXWin_258() async throws {
            // given
            let gameCardRef_0 = try #require(await gameBoard.getCard(.init(0)))
            let gameCardRef_1 = try #require(await gameBoard.getCard(.init(1)))
            let gameCardRef_2 = try #require(await gameBoard.getCard(.init(2)))
            let gameCardRef_5 = try #require(await gameBoard.getCard(.init(5)))
            let gameCardRef_8 = try #require(await gameBoard.getCard(.init(8)))
            
            // when
            await gameCardRef_2.select()
            await gameCardRef_0.select()
            await gameCardRef_5.select()
            await gameCardRef_1.select()
            await gameCardRef_8.select()
            
            // then
            await #expect(gameBoard.isEnd == true)
            await #expect(gameBoard.result == .win(.X))
        }
        @Test func whenXWin_048() async throws {
            // given
            let gameCardRef_0 = try #require(await gameBoard.getCard(.init(0)))
            let gameCardRef_1 = try #require(await gameBoard.getCard(.init(1)))
            let gameCardRef_2 = try #require(await gameBoard.getCard(.init(2)))
            let gameCardRef_4 = try #require(await gameBoard.getCard(.init(4)))
            let gameCardRef_8 = try #require(await gameBoard.getCard(.init(8)))
            
            // when
            await gameCardRef_0.select()
            await gameCardRef_1.select()
            await gameCardRef_4.select()
            await gameCardRef_2.select()
            await gameCardRef_8.select()
            
            // then
            await #expect(gameBoard.isEnd == true)
            await #expect(gameBoard.result == .win(.X))
        }
        @Test func whenXWin_246() async throws {
            // given
            let gameCardRef_0 = try #require(await gameBoard.getCard(.init(0)))
            let gameCardRef_1 = try #require(await gameBoard.getCard(.init(1)))
            let gameCardRef_2 = try #require(await gameBoard.getCard(.init(2)))
            let gameCardRef_4 = try #require(await gameBoard.getCard(.init(4)))
            let gameCardRef_6 = try #require(await gameBoard.getCard(.init(6)))
            
            // when
            await gameCardRef_2.select()
            await gameCardRef_0.select()
            await gameCardRef_4.select()
            await gameCardRef_1.select()
            await gameCardRef_6.select()
            
            // then
            await #expect(gameBoard.isEnd == true)
            await #expect(gameBoard.result == .win(.X))
        }
        
        @Test func whenOWin_012() async throws {
            // given
            let gameCardRef_0 = try #require(await gameBoard.getCard(.init(0)))
            let gameCardRef_1 = try #require(await gameBoard.getCard(.init(1)))
            let gameCardRef_2 = try #require(await gameBoard.getCard(.init(2)))
            let gameCardRef_3 = try #require(await gameBoard.getCard(.init(3)))
            let gameCardRef_4 = try #require(await gameBoard.getCard(.init(4)))
            let gameCardRef_6 = try #require(await gameBoard.getCard(.init(6)))
            
            // when
            await gameCardRef_3.select()
            await gameCardRef_0.select()
            await gameCardRef_4.select()
            await gameCardRef_1.select()
            await gameCardRef_6.select()
            await gameCardRef_2.select()
            
            // then
            await #expect(gameBoard.isEnd == true)
            await #expect(gameBoard.result == .win(.O))
        }
        @Test func whenOWin_345() async throws {
            // given
            let gameCardRef_0 = try #require(await gameBoard.getCard(.init(0)))
            let gameCardRef_1 = try #require(await gameBoard.getCard(.init(1)))
            let gameCardRef_3 = try #require(await gameBoard.getCard(.init(3)))
            let gameCardRef_4 = try #require(await gameBoard.getCard(.init(4)))
            let gameCardRef_5 = try #require(await gameBoard.getCard(.init(5)))
            let gameCardRef_6 = try #require(await gameBoard.getCard(.init(6)))
            
            // when
            await gameCardRef_0.select()
            await gameCardRef_3.select()
            await gameCardRef_1.select()
            await gameCardRef_4.select()
            await gameCardRef_6.select()
            await gameCardRef_5.select()
            
            // then
            await #expect(gameBoard.isEnd == true)
            await #expect(gameBoard.result == .win(.O))
        }
        @Test func whenOWin_678() async throws {
            // given
            let gameCardRef_0 = try #require(await gameBoard.getCard(.init(0)))
            let gameCardRef_1 = try #require(await gameBoard.getCard(.init(1)))
            let gameCardRef_3 = try #require(await gameBoard.getCard(.init(3)))
            let gameCardRef_6 = try #require(await gameBoard.getCard(.init(6)))
            let gameCardRef_7 = try #require(await gameBoard.getCard(.init(7)))
            let gameCardRef_8 = try #require(await gameBoard.getCard(.init(8)))
            
            // when
            await gameCardRef_0.select()
            await gameCardRef_6.select()
            await gameCardRef_1.select()
            await gameCardRef_7.select()
            await gameCardRef_3.select()
            await gameCardRef_8.select()
            
            // then
            await #expect(gameBoard.isEnd == true)
            await #expect(gameBoard.result == .win(.O))
        }
        @Test func whenOWin_036() async throws {
            // given
            let gameCardRef_1 = try #require(await gameBoard.getCard(.init(1)))
            let gameCardRef_0 = try #require(await gameBoard.getCard(.init(0)))
            let gameCardRef_2 = try #require(await gameBoard.getCard(.init(2)))
            let gameCardRef_3 = try #require(await gameBoard.getCard(.init(3)))
            let gameCardRef_4 = try #require(await gameBoard.getCard(.init(4)))
            let gameCardRef_6 = try #require(await gameBoard.getCard(.init(6)))
            
            // when
            await gameCardRef_1.select()
            await gameCardRef_0.select()
            await gameCardRef_2.select()
            await gameCardRef_3.select()
            await gameCardRef_4.select()
            await gameCardRef_6.select()
            
            // then
            await #expect(gameBoard.isEnd == true)
            await #expect(gameBoard.result == .win(.O))
        }
        @Test func whenOWin_147() async throws {
            // given
            let gameCardRef_0 = try #require(await gameBoard.getCard(.init(0)))
            let gameCardRef_1 = try #require(await gameBoard.getCard(.init(1)))
            let gameCardRef_2 = try #require(await gameBoard.getCard(.init(2)))
            let gameCardRef_4 = try #require(await gameBoard.getCard(.init(4)))
            let gameCardRef_5 = try #require(await gameBoard.getCard(.init(5)))
            let gameCardRef_7 = try #require(await gameBoard.getCard(.init(7)))
            
            // when
            await gameCardRef_0.select()
            await gameCardRef_1.select()
            await gameCardRef_2.select()
            await gameCardRef_4.select()
            await gameCardRef_5.select()
            await gameCardRef_7.select()
            
            // then
            await #expect(gameBoard.isEnd == true)
            await #expect(gameBoard.result == .win(.O))
        }
        @Test func whenOWin_258() async throws {
            // given
            let gameCardRef_0 = try #require(await gameBoard.getCard(.init(0)))
            let gameCardRef_1 = try #require(await gameBoard.getCard(.init(1)))
            let gameCardRef_2 = try #require(await gameBoard.getCard(.init(2)))
            let gameCardRef_3 = try #require(await gameBoard.getCard(.init(3)))
            let gameCardRef_5 = try #require(await gameBoard.getCard(.init(5)))
            let gameCardRef_8 = try #require(await gameBoard.getCard(.init(8)))
            
            // when
            await gameCardRef_0.select()
            await gameCardRef_2.select()
            await gameCardRef_1.select()
            await gameCardRef_5.select()
            await gameCardRef_3.select()
            await gameCardRef_8.select()
            
            // then
            await #expect(gameBoard.isEnd == true)
            await #expect(gameBoard.result == .win(.O))
        }
        @Test func whenOWin_048() async throws {
            // given
            let gameCardRef_0 = try #require(await gameBoard.getCard(.init(0)))
            let gameCardRef_1 = try #require(await gameBoard.getCard(.init(1)))
            let gameCardRef_2 = try #require(await gameBoard.getCard(.init(2)))
            let gameCardRef_3 = try #require(await gameBoard.getCard(.init(3)))
            let gameCardRef_4 = try #require(await gameBoard.getCard(.init(4)))
            let gameCardRef_8 = try #require(await gameBoard.getCard(.init(8)))
            
            // when
            await gameCardRef_1.select()
            await gameCardRef_0.select()
            await gameCardRef_2.select()
            await gameCardRef_4.select()
            await gameCardRef_3.select()
            await gameCardRef_8.select()
            
            // then
            await #expect(gameBoard.isEnd == true)
            await #expect(gameBoard.result == .win(.O))
        }
        @Test func whenOWin_246() async throws {
            // given
            let gameCardRef_0 = try #require(await gameBoard.getCard(.init(0)))
            let gameCardRef_1 = try #require(await gameBoard.getCard(.init(1)))
            let gameCardRef_2 = try #require(await gameBoard.getCard(.init(2)))
            let gameCardRef_3 = try #require(await gameBoard.getCard(.init(3)))
            let gameCardRef_4 = try #require(await gameBoard.getCard(.init(4)))
            let gameCardRef_6 = try #require(await gameBoard.getCard(.init(6)))
            
            // when
            await gameCardRef_0.select()
            await gameCardRef_2.select()
            await gameCardRef_1.select()
            await gameCardRef_4.select()
            await gameCardRef_3.select()
            await gameCardRef_6.select()
            
            // then
            await #expect(gameBoard.isEnd == true)
            await #expect(gameBoard.result == .win(.O))
        }
        
        @Test func whenDraw() async throws {
            // given
            let gameCardRef_0 = try #require(await gameBoard.getCard(.init(0)))
            let gameCardRef_1 = try #require(await gameBoard.getCard(.init(1)))
            let gameCardRef_2 = try #require(await gameBoard.getCard(.init(2)))
            let gameCardRef_3 = try #require(await gameBoard.getCard(.init(3)))
            let gameCardRef_4 = try #require(await gameBoard.getCard(.init(4)))
            let gameCardRef_5 = try #require(await gameBoard.getCard(.init(5)))
            let gameCardRef_6 = try #require(await gameBoard.getCard(.init(6)))
            let gameCardRef_7 = try #require(await gameBoard.getCard(.init(7)))
            let gameCardRef_8 = try #require(await gameBoard.getCard(.init(8)))

            // when
            await gameCardRef_0.select() // X
            await gameCardRef_1.select() // O
            await gameCardRef_2.select() // X
            await gameCardRef_4.select() // O
            await gameCardRef_3.select() // X
            await gameCardRef_5.select() // O
            await gameCardRef_7.select() // X
            await gameCardRef_6.select() // O
            await gameCardRef_8.select() // X

            // then
            await #expect(gameBoard.isEnd == true)
            await #expect(gameBoard.result == .draw)
        }
    }
}



// MARK: Helphers
private func getGameCard(_ tictactoe: TicTacToe) async throws -> GameCard {
    // create GameBoard
    try await #require(tictactoe.boards.isEmpty)
    
    await tictactoe.createGame()
    try await #require(tictactoe.boards.count == 1)
    
    let gameBoard = try #require(await tictactoe.boards.first)
    
    // create GameCard
    await gameBoard.setUp()
    
    let firstPosition = GameBoard.CardPosition(1)
    let gameCard = try #require(await gameBoard.getCard(firstPosition))
    
    return gameCard
}


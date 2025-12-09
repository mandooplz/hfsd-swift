//
//  GameBoardLabel.swift
//  TicTacToeMac
//
//  Created by 김민우 on 7/31/25.
//
import SwiftUI


// MARK: View
struct GameBoardLabel: View {
    // MARK: core
    let gameBoard: GameBoard
    
    
    // MARK: body
    var body: some View {
        Text("Game \(gameBoard.id.id.uuidString.prefix(4))")
            // lifecycle
            .task {
                await gameBoard.setUp()
            }
        
            // action
            .contextMenu {
                Button("게임 삭제하기") {
                    Task {
                        await gameBoard.removeBoard()
                    }
                }
            }
    }
}


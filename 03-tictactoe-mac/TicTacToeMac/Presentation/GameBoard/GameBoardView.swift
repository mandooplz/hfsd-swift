//
//  GameBoardView.swift
//  TicTacToeMac
//
//  Created by 김민우 on 7/31/25.
//
import SwiftUI


// MARK: View
struct GameBoardView: View {
    // MARK: core
    let gameBoard: GameBoard

    
    // MARK: body
    var body: some View {
        VStack {
            GameBoardStatus(
                gameBoard: gameBoard
            )
            
            GameCardGrid(
                gameBoard: gameBoard
            )
        }
        
        // navigtion
        .toolbar {
            if gameBoard.isEnd {
                ToolbarItem(placement: .primaryAction) {
                    Button {
                        Task {
                            await gameBoard.removeBoard()
                        }
                    } label: {
                        Image(systemName: "trash")
                    }
                }
            }
        }
    }
}


// MARK: Component
fileprivate struct GameBoardStatus: View {
    let gameBoard: GameBoard
    
    var body: some View {
        HStack {
            Text("Current Player: \(gameBoard.currentPlayer.rawValue)")
            
            Spacer()
            
            if gameBoard.isEnd {
                VStack {
                    if let result = gameBoard.result {
                        switch result {
                        case .draw:
                            Text("It's a draw!")
                                
                        case .win(let player):
                            Text("\(player.rawValue) wins!")
                                .foregroundStyle(Color.blue)
                        }
                    }
                }
            }
        }
        .font(.title)
        .padding()
    }
}

fileprivate struct GameCardGrid: View {
    let gameBoard: GameBoard
    
    var body: some View {
        Grid {
            ForEach(0..<3) { row in
                GridRow {
                    ForEach(0..<3) { col in
                        let position = GameBoard.CardPosition(row * 3 + col)
                        
                        if let card = gameBoard.getCard(position) {
                            GameCardView(gameCard: card)
                        }
                    }
                }
            }
        }
    }
}



// MARK: Preview
fileprivate struct GameBoardPreview: View {
    let tictactoe = TicTacToe()
    
    var body: some View {
        if let gameBoard = tictactoe.boards.first {
            GameBoardView(gameBoard: gameBoard)
        } else {
            ProgressView("GameBoard Preview")
                .task {
                    await tictactoe.createGame()
                    
                    let gameBoard = tictactoe.boards.first
                    await gameBoard?.setUp()
                }
        }
    }
}

#Preview {
    GameBoardPreview()
        .frame(width: 600, height: 600)
}

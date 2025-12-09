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
    init(_ gameBoardRef: GameBoard) {
        self.gameBoard = gameBoardRef
    }

    
    // MARK: body
    var body: some View {
        VStack {
            HStack {
                Text("Current Player: \(gameBoard.currentPlayer == .X ? "X" : "O")")
                
                Spacer()
                
                if gameBoard.isEnd { GameResultLabel }
            }
            .font(.title)
            .padding()

            CardsGrid
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
extension GameBoardView {
    var GameResultLabel: some View {
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
    var CardsGrid: some View {
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
private struct GameBoardPreview: View {
    let tictactoeRef = TicTacToe()
    
    var body: some View {
        if let gameBoard = tictactoeRef.boardList.first {
            GameBoardView(gameBoard)
        } else {
            ProgressView("GameBoard Preview")
                .task {
                    await tictactoeRef.createGame()
                }
        }
    }
}

#Preview {
    GameBoardPreview()
}

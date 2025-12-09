//
//  GameCardView.swift
//  TicTacToeMac
//
//  Created by 김민우 on 7/31/25.
//
import SwiftUI


// MARK: View
struct GameCardView: View {
    // MARK: model
    let gameCard: GameCard

    
    // MARK: body
    var body: some View {
        CardLayout {
            
            CardBackground()

            CardPlayerLabel(
                text: gameCard.player?.rawValue
            )
            
        } whenTapped: {
            Task {
                await gameCard.select()
            }
        }
    }
}


// MARK: Component
fileprivate struct CardLayout<Content: View>: View {
    @ViewBuilder let content: () -> Content
    let whenTapped: () -> Void
    
    var body: some View {
        ZStack {
            content()
        }
        .onTapGesture {
            whenTapped()
        }
        // layout
        .padding()
    }
}

fileprivate struct CardBackground: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 8)
            .fill(Color.gray.opacity(0.2))
            .aspectRatio(1, contentMode: .fit)
            .frame(minWidth: 100, minHeight: 100)
    }
}

fileprivate struct CardPlayerLabel: View {
    let text: String?
    
    var body: some View {
        if let text {
            Text(text)
                .font(.largeTitle)
                .fontWeight(.bold)
        }
    }
}


// MARK: Preview
fileprivate struct GameCardPreview: View {
    let tictactoe = TicTacToe()
    
    var body: some View {
        if let gameBoard = tictactoe.boards.first,
           let gameCard = gameBoard.cards.first {
            GameCardView(gameCard: gameCard)
        } else {
            ProgressView()
                .task {
                    await tictactoe.createGame()
                    
                    let gameBoard = tictactoe.boards.first!
                    await gameBoard.setUp()
                }
        }
    }
}


#Preview {
    GameCardPreview()
}


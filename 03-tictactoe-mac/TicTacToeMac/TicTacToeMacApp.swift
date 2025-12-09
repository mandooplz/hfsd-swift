//
//  TicTacToeMacApp.swift
//  TicTacToeMac
//
//  Created by 김민우 on 7/31/25.
//
import SwiftUI



// MARK: App
@main
struct TicTacToeMacApp: App {
    let tictactoe = TicTacToe()
    
    var body: some Scene {
        WindowGroup {
            TicTacToeView(tictactoe: tictactoe)
        }
        
        .commands {
            CommandMenu("Game") {
                Button("게임 생성") {
                    Task {
                        await tictactoe.createGame()
                    }
                }
            }
        }
    }
}

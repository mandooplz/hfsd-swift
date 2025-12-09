//
//  ContentView.swift
//  TicTacToeMac
//
//  Created by 김민우 on 7/31/25.
//
import SwiftUI



// MARK: View
struct TicTacToeView: View {
    // MARK: core
    let tictactoeRef: TicTacToe
    init(_ tictactoeRef: TicTacToe) {
        self.tictactoeRef = tictactoeRef
    }
    
    // MARK: state
    @State private var selectedBoard: GameBoard.ID?

    
    // MARK: body
    var body: some View {
        TicTacToeLayout(
            sidebar: {
                NewGameButton(
                    label: "New Game",
                    action: {
                        Task {
                            await tictactoeRef.createGame()
                            
                            self.selectedBoard = tictactoeRef.boardList.last
                        }
                    }
                )
                
                GameList(
                    tictactoeRef: tictactoeRef,
                    selectedBoard: $selectedBoard
                )
            },
            content: {
                if let selectedBoard,
                    let board = selectedBoard.ref {
                    GameBoardView(board)
                } else {
                    BoardEmptyView()
                }
            }
        )
    }
}


// MARK: Component
fileprivate struct TicTacToeLayout<S: View, M: View> : View {
    @ViewBuilder let sidebar: () -> S
    @ViewBuilder let content: () -> M
    
    var body: some View {
        NavigationSplitView {
            sidebar()
        } detail: {
            content()
        }
    }
}
fileprivate struct NewGameButton: View {
    let label: String
    let action: () -> Void
    
    var body: some View {
        Button(self.label) {
            action()
        }
        .padding()
    }
}

fileprivate struct GameList: View {
    let tictactoeRef: TicTacToe
    let selectedBoard: Binding<GameBoard.ID?>
    
    var body: some View {
        List(tictactoeRef.boardList, selection: selectedBoard) { gameBoardID in
            NavigationLink(value: gameBoardID) {
                if let gameBoardRef = gameBoardID.ref {
                    GameBoardLabel(gameBoardRef)
                }
            }
        }
    }
}

fileprivate struct BoardEmptyView: View {
    var body: some View {
        VStack {
            Image(systemName: "gamecontroller")
                .font(.largeTitle)
            Text("새로운 게임을 시작해보세요")
                .font(.title)
            Text("New Game 버튼을 눌러 새로운 게임을 시작할 수 있습니다.")
                .font(.subheadline)
                .foregroundStyle(.secondary)
        }
    }
}



// Preview
#Preview {
    TicTacToeView(.init())
}

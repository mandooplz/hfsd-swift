# 03-tictactoe-mac · macOS Tic-Tac-Toe

## Overview
- macOS SwiftUI 앱으로 OBSD 오브젝트 매니저 패턴과 다중 게임판 흐름을 시각화합니다.
- `TicTacToe` 루트가 보드 생성을 관리하고, 각 `GameBoard`는 `GameCard` 값으로 상태/승패를 판정합니다.

## Highlights
- `TicTacToeManager`가 루트 ↔ 서브 오브젝트 생명주기를 명시적으로 추적합니다.
- `NavigationSplitView + Grid` 조합으로 보드 목록과 세부 상태를 동시에 보여 줍니다.
- SwiftUI 상태 업데이트는 `@Observable` 객체와 `@State` 바인딩으로만 연결되어 UI 의존성을 줄였습니다.

## Run
1. `TicTacToeMac.xcodeproj`를 열고 대상(Target)을 `TicTacToeMac`으로 설정합니다.
2. macOS 14+에서 실행하거나 SwiftUI Preview로 `TicTacToeView`를 확인합니다.

## Tech Stack
- Swift 5.9+, Swift Concurrency(`async/await`, `@MainActor`)
- Observation Framework(`@Observable`)
- SwiftUI `NavigationSplitView`, `Grid`, `List`

## Demo

![TicTacToe 시연](tictactoe-mac-play.gif)

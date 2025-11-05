# 03-tictactoe-mac — macOS용 틱택토 OBSD 예제

## 프로젝트 개요
- Object-Based Software Development(OBSD) 패턴을 macOS SwiftUI 앱에 적용한 샘플입니다.
- 여러 게임판을 생성하고 결과를 관리하는 틱택토 시나리오로, 객체 수명과 상태 흐름을 시각적으로 확인할 수 있습니다.

## 핵심 구성 요소
- `TicTacToe`: 게임판 컬렉션을 관리하고 새 게임을 시작하는 루트 오브젝트입니다.
- `GameBoard`: 한 판의 보드 상태를 추적하며, `GameCard` 값과 승패 판정을 책임집니다.
- `GameCard`: 각 칸의 플레이어 표시와 선택 불가 상태를 표현하는 값 객체입니다.
- `TicTacToeView`, `GameBoardView`, `GameCardView`: NavigationSplitView와 Grid를 사용해 보드 목록·상세를 macOS UI로 구성합니다.

## 실행 방법
- `TicTacToeMac.xcodeproj`를 Xcode에서 열고 대상(Target)을 `TicTacToeMac`으로 선택해 실행합니다.
- macOS 14 이상에서 테스트되었으며, SwiftUI Preview에서도 `TicTacToeView`/`GameBoardView`를 확인할 수 있습니다.

## 학습 포인트
- OBSD 스타일의 오브젝트 매니저(`TicTacToeManager`)를 통해 루트/서브 오브젝트 수명 관리 패턴을 살펴볼 수 있습니다.
- 비동기 액션(`createGame`, `removeBoard`)과 SwiftUI 상태(`@State`, `NavigationLink`)를 안전하게 연결하는 방법을 제공합니다.
- macOS 전용 `NavigationSplitView`, `Grid` 컴포넌트를 활용해 다중 패널 레이아웃을 구현하는 예제를 제공합니다.

## 사용 기술
- Swift 5.9+ 및 Swift Concurrency(`async/await`, `@MainActor`)
- Observation Framework(`@Observable`)
- SwiftUI(`NavigationSplitView`, `Grid`, `List`, `@State`)
- macOS 타깃 빌드(Xcode 15+, macOS 14 Sonoma 기준)

## 시연 영상

![TicTacToe 시연](tictactoe-mac-play.gif)


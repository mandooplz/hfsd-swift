# HFSD Swift Samples

## 📌 HFSD란?

HFSD(Human-Friendly Softwared Design)은 소프트웨어를 사용자 친화적으로 설계 및 디자인하기 위한 방법론으로, 개발자의 구현 의도를 분명하게 드러내는 동시에 사용자가 자연스럽고 직관적으로 사용할 수 있는 경험을 제공하는 것을 목표로 합니다.

이를 위해 객체(Object)라는 개념을 중심으로 소프트웨어를 명확히 구조화하는 방법을 고안했고, 이를 통해 예측 가능하고 이해하기 쉬운 흐름을 갖도록 하였습니다. 이러한 설계 철학은 라이브러리, 서버 애플리케이션, 모바일 앱, 웹 앱 등 어떤 종류의 소프트웨어에도 동일하게 적용될 수 있습니다.

## 📌 예제 코드 개요

이 저장소는 Swift로 구현한 HFSD 실험장을 한곳에 모은 것입니다. 각 디렉터리는 하나의 시나리오에 집중해 최소한의 코드로 개념을 보여주며, 최신 Swift 5.9+/Xcode 15+ 환경을 기준으로 유지됩니다.

| #   | 프로젝트           | 시나리오                           | 주요 포인트                                                                                                | Docs                                                       |
| --- | ------------------ | ---------------------------------- | ---------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------- |
| 01  | **cheetos**        | UIKit 운세 메신저 앱               | Swift Concurrency(`async/await`, `@MainActor`), Observation(`@Observable`), Auto Layout, iOS 17 시뮬레이터 | [01-cheetos/README.md](01-cheetos/README.md)               |
| 02  | **bookstore**      | SwiftUI + Core Data 아이템 보드    | `NavigationStack`, `List`, `@State`, Core Data `NSPersistentContainer`, 실행 모드 전환                     | [02-bookstore/README.md](02-bookstore/README.md)           |
| 03  | **tictactoe-mac**  | macOS용 SwiftUI 틱택토             | Observation Framework, `NavigationSplitView`, `Grid`, `List`, macOS 14 타깃                                | [03-tictactoe-mac/README.md](03-tictactoe-mac/README.md)   |
| 04  | **sliding-window** | Sliding Window Maximum 솔루션      | SwiftPM CLI 타깃, 입력 파싱, 윈도우 모델링, 유닛 테스트                                                    | [04-sliding-window/README.md](04-sliding-window/README.md) |
| 05  | **my-chat**        | Vapor 서버 + SwiftUI 채팅 샘플     | `actor` 기반 동시성, Vapor(WebSocket/REST/인증), iOS 클라이언트 연동, `curl` 테스트                        | [05-my-chat/README.md](05-my-chat/README.md)               |
| 06  | **solver**         | 버블 정렬 단계를 객체로 푼 SwiftPM | MainActor 상태 관리, `BubbleSorter`/`BubbleItem` 분리, SwiftPM 멀티 타깃, XCTest로 값·행동 테스트          | [06-solver](06-solver)                                     |

## 📚 참고 자료

- [컴퓨터 밑바닥의 비밀](https://product.kyobobook.co.kr/detail/S000212650856)
- [객체 지향 UI 디자인](https://product.kyobobook.co.kr/detail/S000001805113)

## ⚖️ License

Apache License 2.0 (see `LICENSE`).

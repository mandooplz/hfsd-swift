# HFSD Swift Samples

## HFSD(Human-Friendly Software Design)

HFSD는 사람들이 소프트웨어를 더 쉽게 이해할 수 있도록 만들어진 소프트웨어의 디자인 방법론입니다. HFSD를 활용하면 다양한 종류의 소프트웨어(모바일 앱, 웹 서버, IoT 애플리케이션)들을 같은 방식으로 설계하고 개발할 수 있습니다.

이 리포지토리는 HFSD(Human-Friendly Software Design)을 기반으로 작성된 다양한 Swift 예제들을 모아놓은 샘플 컬렉션입니다. Swift로 HFSD를 실험하거나 실제 프로젝트에 적용해보고 싶을 때 참고할 수 있도록,
작은 단위의 예제들부터 간단한 애플리케이션 흐름까지 다양한 형태의 코드 샘플이 포함되어 있습니다.

## Samples Overview

| #   | 프로젝트           | 시나리오                                      | 사용 기술                                                                                                                                                  | README                                                     |
| --- | ------------------ | --------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------- |
| 01  | **cheetos**        | UIKit 기반 운세 메신저 iOS 앱                 | Swift 5.9+, Swift Concurrency(`async/await`, `@MainActor`), Observation Framework(`@Observable`), UIKit + Auto Layout, Xcode 15+/iOS 17 시뮬레이터         | [01-cheetos/README.md](01-cheetos/README.md)               |
| 02  | **bookstore**      | SwiftUI + Core Data 기반 아이템 보드          | Swift 5.9+, SwiftUI(`NavigationStack`, `List`, `@State`), Swift Concurrency, Core Data(`NSPersistentContainer`), 테스트/실서비스 모드 전환                 | [02-bookstore/README.md](02-bookstore/README.md)           |
| 03  | **tictactoe-mac**  | SwiftUI 기반 틱택토 macOS 앱                  | Swift 5.9+, Swift Concurrency, Observation Framework, macOS SwiftUI(`NavigationSplitView`, `Grid`, `List`), Xcode 15+/macOS 14 타깃                        | [03-tictactoe-mac/README.md](03-tictactoe-mac/README.md)   |
| 04  | **sliding-window** | Sliding Window Maximum 문제 솔루션            | SwiftPM 패키지 구조, 순수 Swift 5 CLI 타깃, 객체 분리 기반 슬라이딩 윈도우 모델, 환경 변수 입력 파싱, 유닛 테스트 케이스 예시                              | [04-sliding-window/README.md](04-sliding-window/README.md) |
| 05  | **my-chat**        | Vapor 서버 + SwiftUI iOS 클라이언트 채팅 샘플 | Swift Concurrency(`actor`, `async/await`), Vapor(WebSocket, REST, 인증 Flow), SwiftUI iOS 앱, Xcode 워크스페이스 구성, 서버/클라이언트 연동 테스트(`curl`) | [05-my-chat/README.md](05-my-chat/README.md)               |

## License

Apache License 2.0 (see `LICENSE`).

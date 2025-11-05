# 02-bookstore — SwiftUI + Core Data OBSD 예제

## 프로젝트 개요
- SwiftUI 기반 아이템 관리(도서 진열) 화면을 통해 OBSD 패턴을 실습하는 프로젝트입니다.
- 실서비스 모드(Core Data)와 테스트 모드(Mock)를 전환하며 객체 경계를 검증할 수 있도록 구성되었습니다.

## 핵심 구성 요소
- `ItemBoard`: 아이템 목록을 유지하고, Flow 계층과 협력해 생성/조회/삭제를 수행하는 루트 오브젝트입니다.
- `Item`: SwiftUI `Identifiable`을 만족하는 값 타입으로, UI가 의존하는 최소 상태만 노출합니다.
- `ItemBoxFlow`: 실제(Core Data)·테스트(Mock) 구현을 모두 제공하며, `SystemMode` 값으로 주입됩니다.
- `ItemBoardView`: SwiftUI `NavigationStack`과 리스트를 사용해 ItemBoard의 상태 변화를 관찰하고, 비동기 액션을 트리거합니다.

## 실행 방법
- `bookstore.xcodeproj`를 Xcode에서 열고 시뮬레이터 또는 기기 대상으로 실행합니다.
- 첫 실행 시 `ItemBoardView`가 자동으로 `fetchItems()`를 호출하여 Core Data 저장소를 동기화합니다.

## 학습 포인트
- OBSD에서 Flow(서비스) 계층을 별도 프로토콜로 분리하고, 테스트 더블을 손쉽게 주입하는 방법을 확인할 수 있습니다.
- SwiftUI의 `task`와 `@State`를 이용해 MainActor 기반 오브젝트와 안전하게 협력하는 패턴을 제공합니다.
- Core Data `NSPersistentContainer`를 Swift Concurrency 컨텍스트에서 다루는 최소 예제를 포함합니다.

## 사용 기술
- Swift 5.9+ 및 Swift Concurrency(`async/await`, `@MainActor`)
- SwiftUI `NavigationStack`, `List`, `@State`
- Core Data (`NSPersistentContainer`, Fetch/Save Flow)
- Xcode 15 이상의 iOS 시뮬레이터 환경


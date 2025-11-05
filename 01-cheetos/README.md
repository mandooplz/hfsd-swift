# 01-cheetos — 운세 메신저 OBSD 예제

## 프로젝트 개요
- Object-Based Software Development(OBSD) 패턴을 iOS UIKit 환경에서 실험하기 위한 예제입니다.
- 운세·조언 메시지를 주고받는 "운세 메신저" 시나리오로, 객체 간 협력과 상태 흐름을 명확하게 보여줍니다.

## 핵심 구성 요소
- `Cheetos`: 메시지 목록을 보관하고 새 운세/사용자 정의 메시지를 생성하는 루트 오브젝트입니다.
- `Fortune`, `MyMessage`: 메시지 도메인 오브젝트로, 비동기 생성과 입력값 캡처 흐름을 각각 담당합니다.
- `MessageInterface`: 테이블 셀을 그리는 SwiftUI/UITableView 혼합 구조 대신, UIKit 기반 뷰 컨트롤러에서 메시지 식별자만 사용해 UI를 갱신합니다.

## 실행 방법
- `Cheetos.xcworkspace`를 Xcode에서 열고, 스킴을 `Cheetos-iOS`로 선택한 뒤 실행합니다.
- iOS 17 이상을 타깃으로 테스트되었으며, `@Observable`, `MainActor` 등 최신 Concurrency/Observation 기능을 사용합니다.

## 학습 포인트
- OBSD에서 오브젝트 등록·해지(`CheetosManager`)를 통해 객체 수명을 추적하는 패턴을 볼 수 있습니다.
- 비동기 액터 메서드에서 UI 업데이트를 안전하게 연결하는 방법을 살펴볼 수 있습니다.
- UIKit 환경에서도 값 타입과 식별자(Value Layer)를 적극 활용하는 방법을 확인할 수 있습니다.

## 사용 기술
- Swift 5.9+ 및 Swift Concurrency(`async/await`, `@MainActor`)
- Observation Framework(`@Observable`)
- UIKit + Auto Layout
- Xcode 15 이상의 iOS 시뮬레이터 환경


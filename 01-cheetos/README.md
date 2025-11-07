# 01-cheetos · Fortune Messenger 샘플

## Overview
- OBSD 스타일의 운세 메신저를 UIKit으로 구현한 iOS 17+ 예제입니다.
- 루트 오브젝트(`Cheetos`)가 메시지 생성을 주도하고, 값 객체 식별자만으로 UI를 갱신해 흐름을 단순화합니다.

## Highlights
- `CheetosManager`가 메시지 오브젝트의 생명주기를 추적하여 등록/해지를 명확히 보여줍니다.
- `Fortune`/`MyMessage`는 입력 캡처 ↔ 비동기 생성 역할을 분리해 값/흐름 계층을 드러냅니다.
- `MessageInterface`는 셀 렌더링 대신 ID를 주고받아 UIKit 컨트롤러가 단순히 뷰 상태만 갱신하게 합니다.

## Run
1. `Cheetos.xcworkspace`를 Xcode 15+에서 열고 스킴을 `Cheetos-iOS`로 설정합니다.
2. iOS 17 시뮬레이터에서 실행하거나 기기에 배포합니다.

## Tech Stack
- Swift 5.9+, Swift Concurrency(`async/await`, `@MainActor`)
- Observation Framework(`@Observable`)
- UIKit + Auto Layout

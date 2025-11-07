# 04-sliding-window · Sliding Window Maximum

SwiftPM 패키지로 작성한 [LeetCode 239](https://leetcode.com/problems/sliding-window-maximum/) 연습문제입니다. 슬라이딩 윈도우를 독립 객체로 취급해 값 관리(`SlidingWindowData`)와 이동 로직(`Window`)을 명확히 분리했습니다.

## Object Model
- `SlidingWindowData`: 입력 배열, 윈도우 크기, 결과 버퍼를 관리하며 `setUpWindow()`·`appendMax(_:)`를 노출합니다.
- `Window`: 현재 창의 값과 인덱스를 추적하고 `moveRight()` 호출마다 새로운 최대를 계산해 데이터 객체로 전달합니다.

## Run
```bash
swift run
```
기본 입력은 `[1, 2, 3]` / `k = 1`이며 결과는 `[1, 2, 3]`으로 출력됩니다.

## Custom Input
- `SLIDING_WINDOW_NUMBERS="1,3,-1,-3,5,3,6,7"`
- `SLIDING_WINDOW_K=3`

```bash
SLIDING_WINDOW_NUMBERS="1,3,-1,-3,5,3,6,7" \
SLIDING_WINDOW_K=3 swift run
# [3, 3, 5, 5, 6, 7]
```

잘못된 입력(음수 k, 배열 길이보다 큰 k 등)은 즉시 오류를 출력하고 종료합니다.

## Quick Checks

| nums | k | expected |
| --- | --- | --- |
| `[1,3,-1,-3,5,3,6,7]` | `3` | `[3,3,5,5,6,7]` |
| `[9,11]` | `2` | `[11]` |
| `[4,2,12,11,-5]` | `1` | `[4,2,12,11,-5]` |

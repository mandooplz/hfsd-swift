//
//  BubbleSortTests.swift
//  Solver
//
//  Created by 김민우 on 12/8/25.
//
import Testing
import Solver


// MARK: Tests
@Suite
struct BubbleSortTests {
    struct SortDataSet: Sendable {
        let description: String   // 어떤 케이스인지 설명
        let input: [Int]
        let expected: [Int]
    }
    
    // 예시 데이터 셋 모음
        static let dataSets: [SortDataSet] = [
            .init(
                description: "기본 섞인 배열",
                input: [5, 1, 4, 2, 8],
                expected: [1, 2, 4, 5, 8]
            ),
            .init(
                description: "거의 정렬된 배열",
                input: [1, 2, 3, 4, 6, 5],
                expected: [1, 2, 3, 4, 5, 6]
            ),
            .init(
                description: "역순 배열 (최악 케이스)",
                input: [9, 7, 6, 4, 2, 1],
                expected: [1, 2, 4, 6, 7, 9]
            ),
            .init(
                description: "중복 포함",
                input: [3, 5, 3, 2, 8, 2, 1],
                expected: [1, 2, 2, 3, 3, 5, 8]
            ),
            .init(
                description: "모두 동일한 값",
                input: [7, 7, 7, 7, 7],
                expected: [7, 7, 7, 7, 7]
            ),
            .init(
                description: "음수 포함",
                input: [-3, 0, -1, 5, 2, -8],
                expected: [-8, -3, -1, 0, 2, 5]
            ),
            .init(
                description: "랜덤 긴 배열",
                input: [12, 5, 9, 1, 20, 3, 15, 8, 7, 2],
                expected: [1, 2, 3, 5, 7, 8, 9, 12, 15, 20]
            )
        ]
    
    @Test(arguments: dataSets) func bubbleSort_sortCorrectly(_ data: SortDataSet) async throws {
        // given
        let sorter = await BubbleSorter(data: data.expected)
        await sorter.setUp()

        // when
        while await sorter.getValidItems().isEmpty == false {
            for item in await sorter.getValidItems() {
                await item.validate()
                await item.exchangeValueWithNextItem()
            }
        }
        
        // then
        let result = await sorter.getResult()
        
        #expect(result == data.expected)
    }
}

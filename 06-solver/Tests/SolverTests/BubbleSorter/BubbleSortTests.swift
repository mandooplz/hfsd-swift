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
    @Test func test1() async throws {
        // given
        let input = [1, 4, 3, 2]
        let expected = [1, 2, 3, 4]
        
        // when
        let result = await Solver.bubbleSort(input)
        
        // then
        #expect(result == expected)
    }
    
    @Test func test2() async throws {
        // given
        let input = [5, 1, 5, 2]
        let expected = [1, 2, 5, 5]

        // when
        let result = await Solver.bubbleSort(input)

        // then
        #expect(result == expected)
    }

    @Test func test3() async throws {
        // given
        let input = [5, 5, 5, 5]
        let expected = [5, 5, 5, 5]

        // when
        let result = await Solver.bubbleSort(input)

        // then
        #expect(result == expected)
    }

    @Test func test4() async throws {
        // given
        let input: [Int] = []
        let expected: [Int] = []

        // when
        let result = await Solver.bubbleSort(input)

        // then
        #expect(result == expected)
    }

    @Test func test5() async throws {
        // given
        let input = [-3, 0, -1, 7, 2]
        let expected = [-3, -1, 0, 2, 7]

        // when
        let result = await Solver.bubbleSort(input)

        // then
        #expect(result == expected)
    }
}

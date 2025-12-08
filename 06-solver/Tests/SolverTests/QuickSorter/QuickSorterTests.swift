//
//  QuickSorterTests.swift
//  Solver
//
//  Created by 김민우 on 12/8/25.
//
import Foundation
import Testing
import Solver


// MARK: Tests
@Suite
struct QuickSorterTests {
    @Test func test1() async throws {
        // given
        let input = [29, 10, 14, 37, 13, 20, 1, 5, 8, 25]
        let expected = [1, 5, 8, 10, 13, 14, 20, 25, 29, 37]
        
        // when
        let result = await Solver.quickSort(input)
        
        // then
        #expect(result == expected)
    }
    
    @Test func test2() async throws {
        // given
        let input = [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
        let expected = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
        
        // when
        let result = await Solver.quickSort(input)
        
        // then
        #expect(result == expected)
    }
    
    @Test func test3() async throws {
        // given
        let input = [5, 5, 5, 5]
        let expected = [5, 5, 5, 5]

        // when
        let result = await Solver.quickSort(input)

        // then
        #expect(result == expected)
    }

    @Test func test4() async throws {
        // given
        let input: [Int] = []
        let expected: [Int] = []

        // when
        let result = await Solver.quickSort(input)

        // then
        #expect(result == expected)
    }

    @Test func test5() async throws {
        // given
        let input = [42]
        let expected = [42]

        // when
        let result = await Solver.quickSort(input)

        // then
        #expect(result == expected)
    }
    
    @Test func test6() async throws {
        // given
        let input = [-3, -1, -7, -4, 2, 0]
        let expected = [-7, -4, -3, -1, 0, 2]

        // when
        let result = await Solver.quickSort(input)

        // then
        #expect(result == expected)
    }

    @Test func test7() async throws {
        // given
        let input = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
        let expected = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

        // when
        let result = await Solver.quickSort(input)

        // then
        #expect(result == expected)
    }

    @Test func test8() async throws {
        // given
        let input = [100, -50, 200, 3, -999, 500]
        let expected = [-999, -50, 3, 100, 200, 500]

        // when
        let result = await Solver.quickSort(input)

        // then
        #expect(result == expected)
    }
}

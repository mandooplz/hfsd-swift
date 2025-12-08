//
//  BubbleSorterTests.swift
//  Solver
//
//  Created by 김민우 on 12/8/25.
//
import Testing
@testable import Solver


// MARK: Tests
@Suite
struct BubbleSorterTests {
    struct Validate {
        let sorter: BubbleSorter
        init() async throws {
            self.sorter = BubbleSorter()
        }
        
        @Test func whenDataCountIsOne() async throws {
            // given
            await sorter.setData([1])
            
            // when
            await sorter.validate()
            
            // then
            await #expect(sorter.isValidData == false)
        }
        @Test func whenDataCountIsZero() async throws {
            // given
            await sorter.setData([])
            
            // when
            await sorter.validate()
            
            // then
            await #expect(sorter.isValidData == false)
        }
        @Test func whenDataCountIsTwo() async throws {
            // given
            await sorter.setData([1,2])
            
            // when
            await sorter.validate()
            
            // then
            await #expect(sorter.isValidData == true)
        }
        @Test func whenDataCountIsThree() async throws {
            // given
            await sorter.setData([1,2,3])
            
            // when
            await sorter.validate()
            
            // then
            await #expect(sorter.isValidData == true)
        }
    }
    
    struct SetUpWindow {
        let sorter: BubbleSorter
        init() async throws {
            self.sorter = BubbleSorter()
        }
        
        @Test func whenDataIsNotValid() async throws {
            // given
            await sorter.setData([0])
            
            try await #require(sorter.window == nil)
            
            // when
            await sorter.setUpWindow()
            
            // then
            await #expect(sorter.window == nil)
        }
        
        @Test func setWindow() async throws {
            // given
            try await #require(sorter.window == nil)
            
            await sorter.setData([4,3,2,1])
            await sorter.validate()
            
            // when
            await sorter.setUpWindow()
            
            // then
            await #expect(sorter.window != nil)
        }
        @Test func setStartWindow() async throws {
            // given
            try await #require(sorter.window == nil)
            
            let input = [5,4,3,2,1]
            await sorter.setData(input)
            await sorter.validate()
            
            try await #require(sorter.isValidData == true)
            
            // when
            await sorter.setUpWindow()
            
            // then
            let window = try #require(await sorter.window)
            
            #expect(window.minIndex == 0)
            #expect(window.maxIndex == 4)
            
            #expect(window.left == 0)
            #expect(window.right == 1)
        }
    }
    
    struct BubbleUp {
        let sorter: BubbleSorter
        init() async throws {
            self.sorter = BubbleSorter()
        }
        
        @Test func sendMaxValueToEnd() async throws {
            // given
            let input = [5,1,2,3,4]
            
            try await sorter.validateAndSetUpWindow(input)
            
            
            // when
            await sorter.bubbleUp()
            
            // then
            let result = await sorter.data
            
            #expect(result == [1,2,3,4,5])
        }
        @Test func sendMaxValueToEnd2() async throws {
            // given
            let input = [1,5,2,3,4]
            
            try await sorter.validateAndSetUpWindow(input)
            
            
            // when
            await sorter.bubbleUp()
            
            // then
            let result = await sorter.data
            
            #expect(result == [1,2,3,4,5])
        }
        @Test func sendMaxValueToEnd3() async throws {
            // given
            let input = [5,1]
            
            try await sorter.validateAndSetUpWindow(input)
            
            
            // when
            await sorter.bubbleUp()
            
            // then
            let result = await sorter.data
            
            #expect(result == [1,5])
        }
        
        @Test func resetWindow() async throws {
            // given
            let input = [1,5,2,3,4]
            
            try await sorter.validateAndSetUpWindow(input)
            
            let window = try #require(await sorter.window)
            
            // when
            await sorter.bubbleUp()
            
            // then
            await #expect(sorter.window == window)
        }
    }
}



// MARK: Helpher
fileprivate extension BubbleSorter {
    func validateAndSetUpWindow(_ input: [Int]) async throws {
        self.setData(input)
        self.validate()
        
        try #require(self.isValidData == true)
        
        self.setUpWindow()
    }
}


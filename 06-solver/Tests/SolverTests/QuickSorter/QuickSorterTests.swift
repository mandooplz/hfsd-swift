//
//  QuickSorterTests.swift
//  Solver
//
//  Created by 김민우 on 12/9/25.
//
import Foundation
import Testing
@testable import Solver


// MARK: Tests
@Suite
struct QuickSorterTests {
    struct DivideData {
        let sorter: QuickSorter
        init() async throws {
            self.sorter = QuickSorter()
        }
        
        @Test func makeThreeSegment() async throws {
            // given
            let input = [1,2,3]
            
            await sorter.setData(input)
            
            try await #require(sorter.data.count == 1)
            
            // when
            await sorter.divideData()
            
            // then
            await #expect(sorter.data.count == 3)
        }
        @Test func makeThreeSegementWhenInputIsEmpty() async throws {
            // given
            let input = [Int]()
            
            await sorter.setData(input)
            
            try await #require(sorter.data.count == 1)
            
            // when
            await sorter.divideData()
            
            // then
            await #expect(sorter.data.count == 3)
        }
        
        
        @Test func secondSegemntIsPivot() async throws {
            // given
            let input = [1,2,3,4,5]
            
            await sorter.setData(input)
            
            // when
            await sorter.divideData()
            
            // then
            let pivotSegement = await sorter.data[1]
            
            try #require(pivotSegement.value.count == 1)
        }
        @Test func firstSegmentIsLessThanPivot() async throws {
            // given
            let input = [5,3,4,1,2]
            
            await sorter.setData(input)
            
            // when
            await sorter.divideData()
            
            // then
            try await #require(sorter.data.count == 3)
            
            let firstSegment = await sorter.data[0]
            
            let pivotValue = await sorter.data[1].value.first!
            
            for segmentValue in firstSegment.value {
                #expect(segmentValue < pivotValue)
            }
        }
        @Test func secondSegmentIsbiggerThanPivot() async throws {
            // given
            let input = [5,1,4,3,2]
            
            await sorter.setData(input)
            
            // when
            await sorter.divideData()
            
            // then
            try await #require(sorter.data.count == 3)
            
            let secondSegment = await sorter.data[2]
            
            let pivotValue = await sorter.data[1].value.first!
            
            for segmentValue in secondSegment.value {
                #expect(segmentValue > pivotValue)
            }
        }
    }
}

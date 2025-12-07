//
//  SlidingWindowTests.swift
//  04-sliding-window
//
//  Created by 김민우 on 12/7/25.
//
import Testing
import SlidingWindowData


// MARK: Tests
@Suite
struct SlidingWindowTests {
    @Test func whenKis3() async throws {
        // given
        let slindingWindowData = await Problem(
            numbers: [1,3,-1,-3,5,3,6,7],
            windowSize: 3
        )
        
        await slindingWindowData.setUpWindow()
        
        let window = try #require(await slindingWindowData.window)
        
        // when
        while await slindingWindowData.isFinished == false {
            await window.addMaxValue()
            await window.moveRight()
        }
        
        // then
        let result = await slindingWindowData.result
        #expect(result == [3,3,5,5,6,7])
    }
    
    @Test func whenKIs1() async throws {
        // given
        let slindingWindowData = await Problem(
            numbers: [1],
            windowSize: 1
        )
        
        await slindingWindowData.setUpWindow()
        
        let window = try #require(await slindingWindowData.window)
        
        // when
        while await slindingWindowData.isFinished == false {
            await window.moveRight()
            await window.addMaxValue()
        }
        
        // then
        let result = await slindingWindowData.result
        #expect(result == [1])
    }
}

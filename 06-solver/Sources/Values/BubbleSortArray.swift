//
//  BubbleSortArray.swift
//  Solver
//
//  Created by 김민우 on 12/8/25.
//
import Foundation
import Solver


// MARK: Value
public nonisolated struct BubbleSortArray: Sendable, Hashable {
    // MARK: core
    private let rawValue: [Int]
    public init(_ rawValue: [Int]) {
        self.rawValue = rawValue
    }
    
    
    // MARK: operator
    public func sorted() async -> [Int] {
        let sorter = BubbleSorter()
        
        await sorter.setData(rawValue)
        await sorter.validate()
        
        await sorter.setUpWindow()
        
        
        for _ in rawValue {
            await sorter.bubbleUp()
        }
        
        return await sorter.data
    }
}

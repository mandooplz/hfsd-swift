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
    public func sortedRawValue() async -> [Int] {
        fatalError()
    }
}

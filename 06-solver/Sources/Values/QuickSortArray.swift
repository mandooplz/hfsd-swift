//
//  QuickSortArray.swift
//  Solver
//
//  Created by 김민우 on 12/8/25.
//
import Foundation


// MARK: Value
public nonisolated struct QuickSortArray<T: Comparable> {
    // MARK: core
    public var array: [T]
    
    public init(_ array: [T]) {
        self.array = array
    }
    
    public init(_ array: T...) {
        self.init(array)
    }
    
    // MARK: operator
}

//
//  QuickSorter.swift
//  Solver
//
//  Created by 김민우 on 12/8/25.
//
import Foundation


// MARK: Object
public actor QuickSorter: Sendable {
    // MARK: core
    public init(_ data: [Int]) {
        self.data = [DataSegment(data)]
    }
    
    
    // MARK: state
    private var data: [DataSegment]
    public func isFinished() -> Bool {
        self.data
            .allSatisfy {
                $0.isFinished || $0.isFixed
            }
    }
    public func getResult() -> [Int] {
        self.data
            .flatMap {
                $0.value
            }
    }
    
    
    // MARK: action
    public func divideData() {
        // capture
        let currentData = self.data
        
        
        // process
        let newData: [DataSegment] = currentData
            .flatMap { segment in
                segment.divideByPivot()
            }
        
        // mutate
        self.data = newData
    }
    
    
    // MARK: value
    struct DataSegment: Sendable, Hashable {
        // MARK: core
        let value: [Int]
        let count: Int
        let isFixed: Bool
        var isFinished: Bool {
            return self.count == 0 || self.count == 1
        }
        init(_ value: [Int], isFixed: Bool = false) {
            self.value = value
            self.count = value.count
            self.isFixed = isFixed
        }
        
        // MARK: operator
        func divideByPivot() -> [DataSegment] {
            // 빈 세그먼트 처리
            guard count > 0 else {
                return [DataSegment([]), DataSegment([]),DataSegment([])]
            }
            
            // 피벗은 랜덤 값으로 선택
            let pivotValue = value.randomElement()!
            
            let left = value.filter { $0 < pivotValue }
            let pivot = value.filter { $0 == pivotValue }
            let right = value.filter { $0 > pivotValue }
            
            return [
                DataSegment(left),
                DataSegment(pivot, isFixed: true),
                DataSegment(right)
                ]
        }
    }
}

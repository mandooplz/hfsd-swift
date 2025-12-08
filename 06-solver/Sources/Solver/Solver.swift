//
//  Solver.swift
//  Solver
//
//  Created by 김민우 on 12/8/25.
//
import Foundation


// MARK: Solver
@available(*, deprecated, message: "Values 값들로 수정될 ")
@MainActor
public struct Solver {
    // MARK: bubbleSort
    public static func bubbleSort(_ data: [Int]) -> [Int] {
        let sorter = BubbleSorter(data: data)
        sorter.setUp()

        while true {
            let items = sorter.getValidItems()
            if items.isEmpty { break }
            
            for item in items {
                item.validate()
                item.exchangeValueWithNextItem()
            }
        }
        
        return sorter.getResult()
    }
    
    
    // MARK: quickSort
    public static func quickSort(_ data: [Int]) -> [Int] {
        let sorter = QuickSorter(data: data)
        
        while sorter.isFinished() == false {
            sorter.divideData()
        }
        
        return sorter.flattenData()
    }
}

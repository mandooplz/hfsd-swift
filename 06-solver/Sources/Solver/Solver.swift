//
//  Solver.swift
//  Solver
//
//  Created by 김민우 on 12/8/25.
//
import Foundation


// MARK: Solver
@MainActor
public struct Solver {
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
}

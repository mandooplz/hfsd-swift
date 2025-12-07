//
//  BubbleSorter.swift
//  Solver
//
//  Created by 김민우 on 12/8/25.
//
import Foundation


// MARK: Object
@MainActor
public final class BubbleSorter: Sendable {
    // MARK: core
    public init(data: [Int]) {
        self.data = data
    }
    
    
    // MARK: state
    private nonisolated let data: [Int]
    
    public private(set) var items: [BubbleItem] = []
    public func getValidItems() -> [BubbleItem] {
        self.items.filter {
            $0.isConfirmed == false
        }
    }
    internal func getItem(_ index: Int) -> BubbleItem? {
        guard self.items.indices.contains(index) else {
            return nil
        }
        
        return self.items[index]
    }
    public func getResult() -> [Int] {
        self.items.map {
            $0.value
        }
    }
    
    
    
    // MARK: action
    public func setUp() {
        // capture
        guard self.items.isEmpty == true else {
            print("BubbleSorter.items에 아이템들이 이미 존재합니다.")
            return
        }
        
        // process
        let enumeratedData = data.enumerated()
        
        // mutate
        self.items = enumeratedData.map { index, num in
            BubbleItem(
                owner: self,
                index: index,
                value: num
            )
        }
    }
}

////
////  BubbleItem.swift
////  Solver
////
////  Created by 김민우 on 12/8/25.
////
//import Foundation
//
//
//// MARK: Object
//@MainActor
//public final class BubbleItem: Sendable {
//    // MARK: core
//    public init(owner: BubbleSorter,
//                index: Int,
//                value: Int) {
//        self.owner = owner
//        self.index = index
//        self.value = value
//    }
//    
//    
//    // MARK: state
//    weak var owner: BubbleSorter?
//    nonisolated let index: Int
//    
//    public var value: Int
//    internal var isConfirmed: Bool = false
//    internal var isValidated: Bool = false
//    
//    
//    // MARK: action
//    public func validate() {
//        // capture
//        let sorter = self.owner!
//        
//        // process
//        let nextIndex = index.advanced(by: 1)
//        let nextItem = sorter.getItem(nextIndex)
//        
//        // mutate
//        if let nextItem, nextItem.isConfirmed == false {
//            self.isValidated = true
//        } else {
//            self.isValidated = false
//            self.isConfirmed = true
//        }
//    }
//    public func exchangeValueWithNextItem() {
//        // capture
//        guard isValidated == true else {
//            print("validate() must be called before.")
//            return
//        }
//        let sorter = self.owner!
//        let currentValue = self.value
//        
//        
//        // process
//        let nextIndex = index.advanced(by: 1)
//        let nextItem = sorter.getItem(nextIndex)!
//        let nextValue = nextItem.value
//        
//        // mutate
//        if nextValue < currentValue {
//            nextItem.value = currentValue
//            self.value = nextValue
//        } else {
//            return
//        }
//
//    }
//}

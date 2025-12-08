//
//  NewBubbleSorter.swift
//  Solver
//
//  Created by 김민우 on 12/8/25.
//
import Foundation
import OSLog


// MARK: Object
public actor NewBubbleSorter: Sendable {
    // MARK: core
    private nonisolated let logger = Logger(subsystem: "NewBubbleSorter", category: "Domain")
    public init() { }
    
    
    // MARK: state
    public private(set) var data: [Int] = []
    public func setData(_ data: [Int]) {
        self.data = data
    }
    public private(set) var isValidData: Bool = false
    
    private(set) var window: ItemWindow? = nil
    
    
    
    // MARK: action
    public func validate() {
        // capture
        guard self.isValidData == false else {
            logger.debug("이미 검증 결과가 존재합니다.")
            return
        }
        let rawData = self.data
        
        // process
        let dataCount = rawData.count
        
        // mutate
        if dataCount > 1 {
            self.isValidData = true
        }
    }
    public func setUpWindow() {
        // capture
        guard isValidData == true else {
            logger.error("validate를 통해 데이터 검증을 먼저 수행해야 합니다.")
            return
        }
        let rawData = self.data
        
        // process
        let minIndex = 0
        let maxIndex = rawData.endIndex - 1
        
        let startWindow = ItemWindow.start(min: minIndex, max: maxIndex)
        
        // mutate
        self.window = startWindow
    }
    
    public func bubbleUp() {
        // capture
        guard isValidData == true else {
            logger.error("validate를 통해 데이터 검증을 먼저 수행해야 합니다.")
            return
        }
        
        guard window != nil else {
            logger.error("현재 window가 설정되어 있지 않습니다.")
            return
        }
        
        // mutate
        while true {
            let window = self.window!
            
            let leftValue = self.data[window.left]
            let rightValue = self.data[window.right]
            
            if leftValue > rightValue {
                self.data.swapAt(window.left, window.right)
            }
            
            guard let nextWindow = window.next() else {
                logger.debug("다음 window가 존재하지 않습니다.")
                break
            }
            self.window = nextWindow
        }
    }
    
    
    
    // MARK: value
    struct ItemWindow: Sendable, Hashable {
        // MARK: core
        let minIndex: Int
        let size: Int = 2
        let left: Int
        let right: Int
        let maxIndex: Int
        
        private init(minIndex: Int, left: Int, right: Int, maxIndex: Int) {
            self.minIndex = minIndex
            self.left = left
            self.right = right
            self.maxIndex = maxIndex
        }
        
        static func start(min: Int, max: Int) -> Self {
            .init(minIndex: min,
                  left: 0,
                  right: 1,
                  maxIndex: max)
        }
        
        
        // MARK: operator
        func reset() -> Self {
            return .init(
                minIndex: self.minIndex,
                left: 0,
                right: 1,
                maxIndex: self.maxIndex
            )
        }
        func next() -> Self? {
            let nextLeft = self.left.advanced(by: 1)
            let nextRight = self.right.advanced(by: 1)
            
            if nextRight > maxIndex {
                return nil
            } else {
                return .init(
                    minIndex: self.minIndex,
                    left: nextLeft,
                    right: nextRight,
                    maxIndex: self.maxIndex
                )
            }
        }
        func decrementMaxIndex() -> Self {
            return .init(
                minIndex: self.minIndex,
                left: self.left,
                right: self.right,
                maxIndex: self.maxIndex - 1
            )
        }
    }
}

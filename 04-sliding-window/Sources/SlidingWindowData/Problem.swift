//
//  File.swift
//  04-sliding-window
//
//  Created by 김민우 on 10/28/25.
//
import Foundation
import OSLog


// MARK: Object
@MainActor
public final class Problem {
    // MARK: core
    private nonisolated let logger = Logger(subsystem: "Problem", category: "Domain")
    public init(numbers: [Int], windowSize: Int) {
        self.numbers = numbers
        self.windowSize = windowSize
    }
    
    
    // MARK: state
    internal let numbers: [Int]
    internal func getNumber(at index: Int) -> Int? {
        guard index >= 0 && index < numbers.count else { return nil }
        return numbers[index]
    }
    
    let windowSize: Int
    public var window: Window? = nil
    public var result: [Int] = []
    public var isFinished: Bool = false
    
    
    
    // MARK: action
    public func setUpWindow() {
        // capture
        guard self.window == nil else {
            logger.error("Window가 이미 존재합니다.")
            return
        }
        let numbers = self.numbers
        let windowSize = self.windowSize
        
        
        // compute
        let initValues = Array(numbers.prefix(windowSize))
        
        
        // mutate
        self.window = Window(self, initValues)
    }
}

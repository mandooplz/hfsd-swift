//
//  Window.swift
//  04-sliding-window
//
//  Created by 김민우 on 10/28/25.
//
import Foundation
import OSLog


// MARK: Object
@MainActor
public final class Window {
    // MARK: core
    private nonisolated let logger = Logger(subsystem: "Window", category: "Domain")
    public init(_ owner: Problem, _ values: [Int]) {
        self.owner = owner
        self.values = values
        self.size = values.count
    }
    
    // MARK: state
    weak var owner: Problem?
    
    let size: Int
    var startPosition: Int = 0
    var endPosition: Int { startPosition + size - 1 }
    
    var values: [Int] = []
    func removeFirst() {
        self.values.removeFirst()
    }
    func append(_ newValue: Int) {
        self.values.append(newValue)
    }
    
    // MARK: action
    public func addMaxValue() {
        // capture
        let problem = self.owner!
        let values = self.values
        
        
        // process
        let maxValue = values.max()!
        
        
        // mutate
        problem.result.append(maxValue)
    }
    
    public func moveRight() {
        // capture
        let problem = self.owner!

        
        // process
        let nextPosition = endPosition.advanced(by: 1)
        let nextValue = problem.getNumber(at: nextPosition)
 
        
        // mutate
        if let nextValue {
            self.removeFirst()
            self.append(nextValue)
            self.startPosition += 1
            logger.debug("값(\(nextValue)이 추가되었습니다.")
        } else {
            problem.isFinished = true
            logger.debug("더 이상 이동이 불가능해 종료됩니다.")
        }
    }
}

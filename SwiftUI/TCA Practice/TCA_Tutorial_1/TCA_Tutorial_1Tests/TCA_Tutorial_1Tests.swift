//
//  TCA_Tutorial_1Tests.swift
//  TCA_Tutorial_1Tests
//
//  Created by Kim Yewon on 2023/10/24.
//

import XCTest
import ComposableArchitecture
@testable import TCA_Tutorial_1

@MainActor
final class TCA_Tutorial_1Tests: XCTestCase {
    func testCounter() async {
        let store = TestStore(initialState: CounterFeature.State()) {
            CounterFeature()
        }
        
        await store.send(.incrementButtonTapped) {
            $0.count = 1
        }
        await store.send(.decrementButtonTapped) {
            $0.count = 0
        }
    }
    
    func testTimer() async {
        let store = TestStore(initialState: CounterFeature.State()) {
            CounterFeature()
        }
        
        await store.send(.toggleTimerButtonTapped) {
            $0.isTimerRunning = true
        }
        await store.send(.toggleTimerButtonTapped) {
            $0.isTimerRunning = false
        }
    }
}

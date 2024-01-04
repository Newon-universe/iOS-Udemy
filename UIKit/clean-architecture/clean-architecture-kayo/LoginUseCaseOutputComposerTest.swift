//
//  LoginUseCaseOutputComposerTest.swift
//  LoginUseCaseOutputComposerTest
//
//  Created by Kim Yewon on 1/4/24.
//

import XCTest
@testable import clean_architecture_kayo


final class LoginUseCaseOutputComposerTest: XCTestCase {
    func test() {
        let sut = LoginUseCaseOutputComposer([])
        sut.loginSuceeded()
        sut.loginFailure()
    }

//    func test_composingOneOutput_delegatesSucceededMessage() {
//        let output1 = LoginUseCaseOutputSpy()
//        let sut = LoginUseCaseOutputComposer([output1])
//        
//        sut.loginSuceeded()
//        
//        XCTAssertEqual(output1.loginSuceededCallCount, 1)
//        XCTAssertEqual(output1.loginFailedCallCount, 0)
//    }
//    
//    func test_composingMultipleOutputs_delegatesSuceededMessage() {
//        let output1 = LoginUseCaseOutputSpy()
//        let output2 = LoginUseCaseOutputSpy()
//        let sut = LoginUseCaseOutputComposer([output1, output2])
//        
//        sut.loginSuceeded()
//        
//        XCTAssertEqual(output1.loginSuceededCallCount, 1)
//        XCTAssertEqual(output1.loginFailedCallCount, 0)
//        
//        XCTAssertEqual(output2.loginSuceededCallCount, 1)
//        XCTAssertEqual(output2.loginFailedCallCount, 0)
//    }
    
    func test_composingMultipleOutputs_delegatesFailedMessage() {
        let output1 = LoginUseCaseOutputSpy()
        let output2 = LoginUseCaseOutputSpy()
        let sut = LoginUseCaseOutputComposer([output1, output2])
        
        sut.loginFailure()
        
        XCTAssertEqual(output1.loginSuceededCallCount, 0)
        XCTAssertEqual(output1.loginFailedCallCount, 1)
        
        XCTAssertEqual(output2.loginSuceededCallCount, 0)
        XCTAssertEqual(output2.loginFailedCallCount, 1)
    }

    //MARK: - helpers
    
    private class LoginUseCaseOutputSpy: LoginUseCaseOutput {
        var loginSuceededCallCount = 0
        var loginFailedCallCount = 0
        
        func loginSuceeded() {
            loginSuceededCallCount += 1
        }
        func loginFailure() {
            loginFailedCallCount += 1
        }
    }
}

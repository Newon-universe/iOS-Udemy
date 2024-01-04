//
//  LoginUseCaseOutputComposer.swift
//  clean-architecture-kayo
//
//  Created by Kim Yewon on 1/4/24.
//

import Foundation

final class LoginUseCaseOutputComposer: LoginUseCaseOutput {
    let outputs: [LoginUseCaseOutput]
    init(_ outputs: [LoginUseCaseOutput]) {
        self.outputs = outputs
    }
    
    func loginSuceeded() {
        outputs.forEach { $0.loginSuceeded() }
    }
    
    func loginFailure() {
        outputs.forEach { $0.loginFailure() }
    }
}

func compose<T>(_ outputs: [(T) -> Void]) -> (T) -> Void {
    return { value in
        outputs.forEach { $0(value) }
    }
}

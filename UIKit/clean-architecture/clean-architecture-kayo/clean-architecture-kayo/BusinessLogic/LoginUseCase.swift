//
//  LoginUserCase.swift
//  clean-architecture-kayo
//
//  Created by Kim Yewon on 1/4/24.
//

import Foundation

protocol LoginUseCaseOutput {
    func loginSuceeded()
    func loginFailure()
}

final class LoginUseCase {
    let output: LoginUseCaseOutput
    
    init(output: LoginUseCaseOutput) {
        self.output = output
    }
    
    func login(name: String, password: String) {
        // if success
        output.loginSuceeded()
        //else
        output.loginFailure()
    }
}

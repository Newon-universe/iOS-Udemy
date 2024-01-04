//
//  CrashlyticsLoginTracker.swift
//  clean-architecture-kayo
//
//  Created by Kim Yewon on 1/4/24.
//

import Foundation

final class CrashlyticsLoginTracker: LoginUseCaseOutput {
    func loginSuceeded() {
        // send login event to crashlytics
    }
    
    func loginFailure() {
        // send error to crashlytics
    }
    
    
}

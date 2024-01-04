//
//  FirebaseAnalyticsLoginTracker.swift
//  clean-architecture-kayo
//
//  Created by Kim Yewon on 1/4/24.
//

import Foundation

final class FirebaseAnalyticsLoginTracker: LoginUseCaseOutput {
    func loginSuceeded() {
        // send login event to firebase
    }
    
    func loginFailure() {
        // send error to firebase
    }
    
    
}

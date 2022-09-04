//
//  FructusApp.swift
//  Fructus
//
//  Created by Kim Yewon on 2022/09/04.
//

import SwiftUI

@main
struct FructusApp: App {
    
    //MARK: - PROPERTIES
    @AppStorage("isOnboarding") var isOnboarding: Bool = true
    
    var body: some Scene {
        WindowGroup {
            if isOnboarding {
                OnboardingView()
            } else {
                ContentView()
            }
        }
    }
}

// Swift UI LifeCycle

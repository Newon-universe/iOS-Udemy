//
//  TCA_Tutorial_1App.swift
//  TCA_Tutorial_1
//
//  Created by Kim Yewon on 2023/10/23.
//

import ComposableArchitecture
import SwiftUI

@main
struct TCA_Tutorial_1App: App {
    
    // It is important to note that the Store that powers the application should only be created a single time. For most applications it should be sufficient to create it directly in the WindowGroup at the root of the scene. But, it can also be held as a static variable and then provided in the scene.
    static let store = Store(
        initialState: CounterFeature.State(),
        reducer: { 
            CounterFeature()
                ._printChanges()
        }
    )
    
    var body: some Scene {
        WindowGroup {
            ContentView(store: TCA_Tutorial_1App.store)
        }
    }
    
    
}

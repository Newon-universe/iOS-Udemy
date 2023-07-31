//
//  observable_stateApp.swift
//  observable_state
//
//  Created by Kim Yewon on 2022/09/22.
//

import SwiftUI

@main
struct observable_stateApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(UserSettings())
        }
    }
}

class UserSettings: ObservableObject {
    @Published var value: Int = 0
}

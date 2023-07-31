//
//  HelloCoreDataApp.swift
//  HelloCoreData
//
//  Created by Kim Yewon on 2022/09/28.
//

import SwiftUI

@main
struct HelloCoreDataApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(coreDM: CoreDataManager())
        }
    }
}

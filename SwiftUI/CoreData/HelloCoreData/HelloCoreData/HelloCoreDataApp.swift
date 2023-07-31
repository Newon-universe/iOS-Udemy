//
//  HelloCoreDataApp.swift
//  HelloCoreData
//
//  Created by Kim Yewon on 2022/12/04.
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

//
//  HelloCoreDataApp.swift
//  HelloCoreData
//
//  Created by Kim Yewon on 2023/08/08.
//

import SwiftUI

@main
struct HelloCoreDataApp: App {
    
    @StateObject var coreDM = CoreDataManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(coreDM)
        }
    }
}

//
//  MovieAppUsingFRApp.swift
//  MovieAppUsingFR
//
//  Created by Kim Yewon on 2023/08/14.
//

import SwiftUI

@main
struct MovieAppUsingFRApp: App {
    
    var coreDM = CoreDataManager.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, coreDM.viewContext)
        }
    }
}

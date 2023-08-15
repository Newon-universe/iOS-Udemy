//
//  CoreDataMVVMApp.swift
//  CoreDataMVVM
//
//  Created by Kim Yewon on 2023/08/14.
//

import SwiftUI

@main
struct CoreDataMVVMApp: App {
    
    let viewContext = CoreDataManager.shared.persistentStoreContainer.viewContext
    
    var body: some Scene {
        WindowGroup {
            ContentView(vm: BudgetListViewModel(context: viewContext))
                .environment(\.managedObjectContext, viewContext)
        }
    }
}

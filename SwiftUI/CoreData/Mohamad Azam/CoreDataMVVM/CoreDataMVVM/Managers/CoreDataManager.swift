//
//  CoreDataManager.swift
//  CoreDataMVVM
//
//  Created by Kim Yewon on 2023/08/14.
//

import Foundation
import CoreData

class CoreDataManager {
    let persistentStoreContainer: NSPersistentContainer
    
    static let shared = CoreDataManager()
    
    private init() {
        persistentStoreContainer = NSPersistentContainer(name: "BudgetAppModel")
        persistentStoreContainer.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Unable to initialize Core data \(error.localizedDescription)")
            }
        }
    }
}

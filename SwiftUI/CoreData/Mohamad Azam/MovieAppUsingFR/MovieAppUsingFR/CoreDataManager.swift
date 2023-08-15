//
//  CoreDataManager.swift
//  MovieAppUsingFR
//
//  Created by Kim Yewon on 2023/08/14.
//

import Foundation
import CoreData

// open means open resourcr for outside.

class CoreDataManager: ObservableObject {
    let persistentContainer: NSPersistentContainer
    static var shared: CoreDataManager = CoreDataManager()
    
    var viewContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    private init() {
        persistentContainer = NSPersistentContainer(name: "MovieAppModel")
        persistentContainer.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Unable to initialize Core data stores \(error)")
            }
        }
    }
    
}

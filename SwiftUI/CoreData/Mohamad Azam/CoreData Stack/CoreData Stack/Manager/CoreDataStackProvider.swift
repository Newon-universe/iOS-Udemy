//
//  CoreDataStack.swift
//  CoreData Stack
//
//  Created by Kim Yewon on 2023/08/09.
//

import Foundation
import CoreData


// Samething but avobe iOS 10
class CoreDataStackProvider {
    let persistentContainer: NSPersistentContainer
    
    init() {
        // model file name should be same with CoreData Model file name.
        persistentContainer = NSPersistentContainer(name: "CoreDataBlocksModel")
        persistentContainer.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Core data failed to initialize \(error.localizedDescription)")
            }
        }
    }
    
    
}

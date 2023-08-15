//
//  CoreDataManager.swift
//  CoreDataImage
//
//  Created by Kim Yewon on 2023/08/15.
//

import Foundation
import CoreData

class CoreDataManager {
    let persistentContainer: NSPersistentContainer
    static let shared: CoreDataManager = CoreDataManager()
    
    private init() {
        ValueTransformer.setValueTransformer(
            UIImageTransformer(),
            forName: NSValueTransformerName("UIImageTransformer")
        )
        persistentContainer = NSPersistentContainer(name: "PhotoModel")
        persistentContainer.loadPersistentStores { description, error in
            if let error = error {
                fatalError(error.localizedDescription)
            }
        }
    }
}

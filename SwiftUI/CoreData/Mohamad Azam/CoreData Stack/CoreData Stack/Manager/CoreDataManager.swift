//
//  CoreDataManager.swift
//  CoreData Stack
//
//  Created by Kim Yewon on 2023/08/09.
//

import Foundation
import CoreData

class CoreDataManager {
    
    lazy var managedObject: NSManagedObjectModel = {
        guard let url = Bundle.main.url(forResource: "CoreDataBlocksModel", withExtension: "momd") else { fatalError("Failed to locate the CoreDataBlocksModel file") }
        guard let model = NSManagedObjectModel(contentsOf: url) else { fatalError("Failed to load model") }
        return model
    }() // load object model
    
    lazy var coordinator: NSPersistentStoreCoordinator = {
        let coordinator = NSPersistentStoreCoordinator(managedObjectModel: managedObject)
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first! // For saving our SQL file
        
        let sqlLitePath = documentsDirectory.appendingPathComponent("CoreDataBlocks.sqlite")
        // This is going to be the actual SQL Lite file which all contain all the tables, all the views and everything that you are doing with the database.
        // You will be not using SQL Lite directly, but use CoreData for manage your relationship to manage the execution of querry, selecting, updating, creating, all of those querry through CoreData.
        
        do {
            // try to attach the persistentStore to our CoreData
            try coordinator.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: sqlLitePath)
        } catch {
            fatalError("Failed to create coordinator.")
        }
        
        return coordinator
    }()
    
    lazy var viewContext: NSManagedObjectContext = {
        // manage object can be available access to main queue
        let context = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
        
        // The reason of telling coordinator to context is so that context will know that whenever coordinator is changed like save the data, it can delegate that call.
        // It can give the persistent store coordinator all the objects that need to be saved to the store, which in most case SQLLite (or maybe in-memory, binary ...)
        context.persistentStoreCoordinator = coordinator
        
        return context
    }()
    
    func saveMovie(title: String) {
        let movie = Movie(context: viewContext)
        movie.title = title
        
        do {
            try viewContext.save()
        } catch {
            print("\(error.localizedDescription)")
        }
    }
    
    
    
}

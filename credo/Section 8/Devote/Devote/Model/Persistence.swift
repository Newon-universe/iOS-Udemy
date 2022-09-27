//
//  Persistence.swift
//  Devote
//
//  Created by Kim Yewon on 2022/09/13.
//

import CoreData

struct PersistenceController {
    //MARK: - 1. Persistent Controller
    // It is Singleton for entire app to use.
    // Instance of persistent controller sets up the model context and store coordinator all at once.
    static let shared = PersistenceController()

    //MARK: - 2. Persistent Container
    // It is storage property for core data.
    // Using persistent container is the preferred way to initialize our core data stack and load our core data model later.
    let container: NSPersistentContainer

    //MARK: - 3. Initialization (load the persistent store)
    // Start by referring the persistent containter to our core data storage called devote.
    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "Devote")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        container.viewContext.automaticallyMergesChangesFromParent = true
    }
    
    //MARK: - 4. Preview
    static var preview: PersistenceController = {
        let result = PersistenceController(inMemory: true)
        let viewContext = result.container.viewContext
        
        for i in 0 ..< 5 {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()
            newItem.task = "Sample task No\(i)"
            newItem.completion = false
            newItem.id = UUID()
        }
        
        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        
        return result
    }()
}

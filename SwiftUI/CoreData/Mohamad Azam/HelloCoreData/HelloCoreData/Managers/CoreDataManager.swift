//
//  CoreDataManager.swift
//  HelloCoreData
//
//  Created by Kim Yewon on 2023/08/08.
//

import Foundation
import CoreData

class CoreDataManager {
    
    let persistentContainer: NSPersistentContainer
    static let shared = CoreDataManager()

    
    init() {
        // CoreData Model name
        persistentContainer = NSPersistentContainer(name: "HelloCoreDataModel")
        persistentContainer.loadPersistentStores { (description, error) in
            if let error = error {
                fatalError("Core Data Store failed to initialize \(error.localizedDescription)")
            }
        }
    }
    var viewContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    
    func getAllMovies() -> [Movie] {
        // you can specify what kind of object you're trying to fetch so that when you get the object, it will be of type movie.
        // It is important that you do specify that you are trying to fetch a entity which is the type movie.
        // If you don't specify that, then you will get a request result and then you will have to do the conversion yourself.
        let fetchRequest: NSFetchRequest<Movie> = Movie.fetchRequest()
        
        do {
            return try persistentContainer.viewContext.fetch(fetchRequest)
        } catch {
            print(error.localizedDescription)
            return []
        }
    }
    
    func saveMovie(title: String) {
        // persistentContainer.viewContext is the manage object context, which works on the main queue.
        // It is keeping track of all the different entities and using the view context.
        
        let movie = Movie(context: persistentContainer.viewContext)
        movie.title = title // even it is optional, if you set up non-optional in coredata model, than it will complain when you give optional value.
        
        do {
            try persistentContainer.viewContext.save() // Every single thing inside that manage object contact is going to get sent.
            print("Movie \(movie.title) saved.")
        } catch {
            print("Failed to save movie. \(error.localizedDescription)")
        }
    }
    
    func deleteMove(movie: Movie) {
        
        persistentContainer.viewContext.delete(movie)
        
        do {
            try persistentContainer.viewContext.save() // It's like a snapshot, you should call this method when something is changed inside of contianer to notice it.
        } catch {
            persistentContainer.viewContext.rollback()
            print("Failed to delete movie. \(error.localizedDescription)")
        }
    }
    
    func updateMovie() {
        do {
            try persistentContainer.viewContext.save()
        } catch {
            persistentContainer.viewContext.rollback()
            print("Failed to save context, \(error.localizedDescription)")
        }
    }
}

//
//  CoreDataManager.swift
//  HelloCoreData
//
//  Created by Kim Yewon on 2022/09/28.
//

import Foundation
import CoreData

class CoreDataManager {
    
    // most top level class
    // responsible for initializing your core data stack
    // basically responsible for loading the model and then all the different sotres associated with the model
    let persistentContainer: NSPersistentContainer
    
    init() {
        // name should be same with model name you created
        persistentContainer = NSPersistentContainer(name: "HelloCoreDataModel")
        persistentContainer.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Core Data Store failed \(error.localizedDescription)")
            }
        }
    }
    
    func getAllMovies() -> [Movie] {
        let fetchRequest: NSFetchRequest<Movie> = Movie.fetchRequest()
        
        do {
            return try persistentContainer.viewContext.fetch(fetchRequest)
        } catch {
            return []
        }
    }
    
    func saveMovie(title: String) {
        
        // you need to instance for persistenting data in core data
        // viewContext is a access to the context which is on the main channel or basically the main thread
        // so you can simply use your ui to persist these things
        // it's not on the background thread, it's on up to available on the main thread
        let movie = Movie(context: persistentContainer.viewContext)
        movie.title = title
        
        do {
            try persistentContainer.viewContext.save()
        } catch {
            print("Failed to save movie \(error)")
        }
    }
    
    func deleteMovie(movie: Movie) {
        persistentContainer.viewContext.delete(movie)
        do {
            try persistentContainer.viewContext.save()
        } catch {
            persistentContainer.viewContext.rollback()
            print("Failed to save context \(error)")
        }
    }
    
    func updateMovie() {
        do {
            try persistentContainer.viewContext.save()
        } catch {
            persistentContainer.viewContext.rollback()
        }
    }
    
}

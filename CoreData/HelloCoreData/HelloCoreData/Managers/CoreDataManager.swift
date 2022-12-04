//
//  CoreDataManager.swift
//  HelloCoreData
//
//  Created by Kim Yewon on 2022/12/04.
//

import Foundation
import CoreData

class CoreDataManager {
    //Object keep track manage object context, and has a lot of function  that we can use to initialize CoreData
    let persistentContainer: NSPersistentContainer
    
    init() {
        // provide model file name
        // * Not a Entity name!!
        persistentContainer = NSPersistentContainer(name: "HelloCoreDataModel")
        persistentContainer.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Core Data Store failed to initialize \(error.localizedDescription)")
            }
            
            
        }
    }
    
    func saveMovie(title: String) {
        // persistentContainer have access to the view context,
        // view context is the manage object context, which works on the main queue.
        // so this means that it is keeping track of all the different entities and using the view context.
        // and using the view context, we are constructing a movie object.
        
        // when you have different models, different manage object context, you have to handle it (later courses)
        let movie = Movie(context: persistentContainer.viewContext)
        
        // even in model file, properties are optional, here the object will tell you property is optional,
        // but when you go to on site, core data will complain you. so you have to keep in mind that it is optional property? or not.
        movie.title = title
        
        // Every single thing inside that manage object context is going to get send.
        do {
            try persistentContainer.viewContext.save()
            print("Movie saved!")
        } catch {
            print("Failed to save movie \(error.localizedDescription)")
        }
    }
    
    func getAllMovies() -> [Movie] {
        
        // The way of access out fetch or retrieve anything from core data is you create a fetch request.
        // when you initialize FetchRequest, you can specify what kind of objevt you're trying to fetch so that when you get the object.
        // Core Data Entities automatically generate function called fetchRequest() which is going to return if you fetch request.
        // Specifying type for fetching Entity is very important.
        // If you don't specify the type, then you will get a request result and then you will heve to do the conversion yourself.
        
        let fetchRequest: NSFetchRequest<Movie> = Movie.fetchRequest()
        
        do {
            // persistentContainer.viewContext.fetch will return array of type that you set from fetchRequest object.
            // In this case, Movie that you specified.
            return try persistentContainer.viewContext.fetch(fetchRequest)
        } catch {
            return []
        }
        
    }
    
    func updateMovie() {
        
        do {
            try persistentContainer.viewContext.save()
        } catch {
            persistentContainer.viewContext.rollback()
        }
        
    }
    
    func deleteMovie(movie: Movie) {
        
        persistentContainer.viewContext.delete(movie)
        
        do {
            try persistentContainer.viewContext.save()
        } catch {
            persistentContainer.viewContext.rollback()
            print("Failed to save context \(error.localizedDescription)")
        }
    }
}

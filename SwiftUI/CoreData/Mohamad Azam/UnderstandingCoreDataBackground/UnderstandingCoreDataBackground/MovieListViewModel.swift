//
//  MovieListViewModel.swift
//  UnderstandingCoreDataBackground
//
//  Created by Kim Yewon on 2023/08/14.
//

import Foundation
import CoreData
import NotificationCenter

class MovieListViewModel: NSObject, ObservableObject {
    
    @Published var movies: [MovieViewModel] = []
    private var fetchedResultsController: NSFetchedResultsController<Movie>!
    
    override init() {
        super.init()
        let didSaveNotitication = NSManagedObjectContext.didSaveObjectsNotification
        // setup notification 
        let context = CoreDataManager.shared.backgroundContext
        NotificationCenter.default.addObserver(self, selector: #selector(didSave(_:)), name: didSaveNotitication, object: context)
    }
    
    @objc func didSave(_ notification: Notification) {
        /*
         let insertedObjectsKey = NSManagedObjectContext.NotificationKey.insertedObjects.rawValue
         print(notification.userInfo?[insertedObjectsKey])
         loadMovies()
         */
        
        /* short term is in CoreDataManager,         persistentContainer.viewContext.automaticallyMergesChangesFromParent = true, but any context
         
         let viewContext = CoreDataManager.shared.viewContext
         DispatchQueue.main.async {
         }
         
         */
    }
    
    func saveMovie(title: String, rating: Int16) {
        CoreDataManager.shared.persistentContainer.performBackgroundTask { context in
            let movie = Movie(context: context)
            movie.title = title
            movie.rating = rating
            
            try? context.save()
        }
    }
    
    func saveMovieViewContext(title: String, rating: Int16) {
        let viewContext = CoreDataManager.shared.persistentContainer.viewContext
        let movie = Movie(context: viewContext)
        movie.title = title
        movie.rating = rating
        
        try? viewContext.save()
    }
    
//    func loadMovies() {
//        let request: NSFetchRequest<Movie> = Movie.fetchRequest()
//
//        do {
//            self.movies = try CoreDataManager.shared.viewContext.fetch(request).map(MovieViewModel.init)
//        } catch {
//            print(error.localizedDescription)
//        }
//    }
    
    func updateRating(movieID: NSManagedObjectID, rating: Int16, in context: NSManagedObjectContext) {
        context.perform {
            let movie = try? context.existingObject(with: movieID) as? Movie
            if let movie = movie {
                movie.rating = rating
                try? context.save()
            }
        }
    }
    
    func loadMovies() {
        let request: NSFetchRequest<Movie> = Movie.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(key: "title", ascending: true)]
        
        fetchedResultsController = NSFetchedResultsController(
            fetchRequest: request,
            managedObjectContext: CoreDataManager.shared.viewContext,
            sectionNameKeyPath: nil,
            cacheName: nil
        )
        fetchedResultsController.delegate = self
        try? fetchedResultsController.performFetch()
        movies = (fetchedResultsController.fetchedObjects ?? []).map(MovieViewModel.init)
    }
}

extension MovieListViewModel: NSFetchedResultsControllerDelegate {
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        movies = (controller.fetchedObjects as? [Movie] ?? []).map(MovieViewModel.init)
    }
}


struct MovieViewModel {
    
    let movie: Movie
    
    let id = UUID()
    
    var title: String {
        return movie.title ?? ""
    }
    
    var rating: Int16 {
        return movie.rating
    }
    
}

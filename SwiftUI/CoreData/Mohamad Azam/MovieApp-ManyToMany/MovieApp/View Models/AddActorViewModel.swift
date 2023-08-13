//
//  AddActorViewModel.swift
//  MovieApp
//
//  Created by Kim Yewon on 2023/08/13.
//

import Foundation
import CoreData

class AddActorViewModel: ObservableObject {
    
    var name: String = ""
    
    func addActorToMovie(movieId: NSManagedObjectID) {
        let movie: Movie? = Movie.byId(id: movieId)
        
        if let movie = movie {
            let actor = Actor(context: Actor.viewContext)
            actor.name = name
            actor.addToMovies(movie) // coredata automatically made this method for us.
            
            try? actor.save()
        }
    }
    
}

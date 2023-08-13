//
//  ActorListViewModel.swift
//  MovieApp
//
//  Created by Kim Yewon on 2023/08/13.
//

import Foundation
import CoreData

class ActorListViewModel: ObservableObject {
    
    @Published var actors = [ActorViewModel]()
    
    func getActorsByMovie(vm: MovieViewModel) {
        DispatchQueue.main.async {
            self.actors = Actor.getActorsByMovieId(movieId: vm.movieId).map(ActorViewModel.init)
        }
    }
    
}

struct ActorViewModel {
    let actor: Actor
    
    var actorId: NSManagedObjectID {
        actor.objectID
    }
    
    var name: String {
        actor.name ?? ""
    }
    
    var movies: [MovieViewModel] {
        Movie.byActorName(name: name).map(MovieViewModel.init)
    }
}

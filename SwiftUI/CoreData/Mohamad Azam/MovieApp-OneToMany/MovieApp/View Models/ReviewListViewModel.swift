//
//  ReviewListViewModel.swift
//  MovieApp
//
//  Created by Mohammad Azam on 3/2/21.
//

import Foundation
import CoreData

class ReviewListViewModel: ObservableObject {
    
    @Published var reviews = [ReviewViewModel]()
    
    func getReviewsByMovie(vm: MovieViewModel) {
        DispatchQueue.main.async {
            self.reviews = Review.getReviewsByMovieId(movieId: vm.id).map(ReviewViewModel.init)
        }
    }
    
    
    /*
    func getReviewsByMovie(movieVM: MovieViewModel) {
        
        let movie = CoreDataManager.shared.getMovieById(id: movieVM.id)
        if let movie = movie {
            DispatchQueue.main.async {
                self.reviews = (movie.reviews?.allObjects as! [Review]).map(ReviewViewModel.init)
            }
        }
    }
    */
     
}

struct ReviewViewModel {
    
    let review: Review
    
    var reviewID: NSManagedObjectID {
        review.objectID
    }
    
    var title: String {
        review.title ?? ""
    }
    
    var text: String {
        return review.text ?? ""
    }
    
    var publishedDate: Date? {
        return review.publishedAt
    }
    
}

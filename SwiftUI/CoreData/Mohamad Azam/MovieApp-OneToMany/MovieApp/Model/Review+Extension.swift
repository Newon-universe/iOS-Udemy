//
//  Review+Extension.swift
//  MovieApp
//
//  Created by Kim Yewon on 2023/08/12.
//

import Foundation
import CoreData

extension Review: BaseModel {
    
    static func getReviewsByMovieId(movieId: NSManagedObjectID) -> [Review] {
        let request: NSFetchRequest<Review> = Review.fetchRequest()
        request.predicate = NSPredicate(format: "movie = %@", movieId)
        
        do {
            return try CoreDataProvider.shared.viewContext.fetch(request)
        } catch {
            return []
        }
    }
    
}

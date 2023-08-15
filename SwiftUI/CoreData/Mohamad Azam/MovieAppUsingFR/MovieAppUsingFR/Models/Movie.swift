//
//  Movie.swift
//  MovieAppUsingFR
//
//  Created by Kim Yewon on 2023/08/14.
//

import Foundation
import CoreData
extension Movie {
    static var all: NSFetchRequest<Movie> = {
        let request: NSFetchRequest<Movie> = Movie.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(key: "title", ascending: true)]
        return request
    }()
    
    static var byRating: NSFetchRequest<Movie> = {
        let request: NSFetchRequest<Movie> = Movie.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(key: "rating", ascending: false)]
        return request
    }()
}

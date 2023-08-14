//
//  ContentView.swift
//  UnderstandingCoreDataBackground
//
//  Created by Mohammad Azam on 3/25/21.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @State private var movies: [Movie] = []
    @State private var movieName: String = ""
    @StateObject private var movieListVM = MovieListViewModel()
    
    
    var body: some View {
        
        NavigationView {
            VStack {
                VStack {
                    TextField("Movie name", text: $movieName)
                    
                    HStack {
                        Button("Save background Context") {
                            movieListVM.saveMovie(title: movieName, rating: Int16.random(in: 1...5))
                            loadMovies()
                        }
                        
                        Spacer()
                        
                        Button("Save View Context") {
                            movieListVM.saveMovieViewContext(title: movieName, rating: Int16.random(in: 1...5))
                            loadMovies()
                        }
                    }.padding()
                }
                
                Spacer()
                
                List(movieListVM.movies, id: \.id) { movie in
                    HStack {
                        Text(movie.title)
                        Spacer()
                        Text("\(movie.rating)")
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                        Button("Update") {
                            movieListVM.updateRating(
                                movieID: movie.movie.objectID,
                                rating: Int16.random(in: 1...5),
                                in: CoreDataManager.shared.backgroundContext
                            )
                        }
                    }
                }.listStyle(PlainListStyle())
                    .navigationTitle("Movies")
                
            }.onAppear(perform: {
                //            loadMovies()
                
                // Even different thread, access to core data property by this way.
                // objectID is thread safety value, means without this way, you can call it.
                //            DispatchQueue.global().async {
                //                let viewContext = CoreDataManager.shared.viewContext
                //                let backgroundContext = CoreDataManager.shared.persistentContainer.newBackgroundContext()
                //                let movies = loadAllMovies(byRating: 1, in: viewContext)
                //
                //                for movie in movies {
                //                    backgroundContext.perform {
                //                        let movie = try? backgroundContext.existingObject(with: movie.objectID) as? Movie
                //                        print(movie?.title)
                //                    }
                //                }
                //
                //                self.movies = movies
                //            }
                
//                loadAllMovies { movies in
//                    self.movies = movies
//
//                    for movie in movies {
//                        print(movie.title ?? "")
//                    }
//                }
                
                movieListVM.loadMovies()
            })
            
        }
        
    }
    
    private func saveMovie(completion: @escaping () -> Void) {
        DispatchQueue.global().async {
            let backgroundContext = CoreDataManager.shared.persistentContainer.newBackgroundContext()
            // performWait is synchronus, perform is asynchrounos
            backgroundContext.perform {
                let movie = Movie(context: backgroundContext)
                movie.title = movieName
                movie.rating = Int16.random(in: 1...5)
                try? backgroundContext.save()
                DispatchQueue.main.async {
                    completion()
                }
            }
        }
    }
    
    private func loadAllMovies(completion: @escaping ([Movie]) -> Void) {
        CoreDataManager.shared.persistentContainer.performBackgroundTask { context in
            let request: NSFetchRequest<Movie> = Movie.fetchRequest()
            guard let movies = try? context.fetch(request) else {
                return
            }
            
            DispatchQueue.main.async {
                let viewContext = CoreDataManager.shared.viewContext
                let movies = movies.compactMap { movie in
                    try? viewContext.existingObject(with: movie.objectID) as? Movie
                }
                
                completion(movies)
            }
        }
    }
    
    private func loadMovies() {
        let request: NSFetchRequest<Movie> = Movie.fetchRequest()
        
        do {
            self.movies = try CoreDataManager.shared.viewContext.fetch(request)
        } catch {
            print(error)
        }
    }
    
    private func loadAllMovies(byRating rating: Int, in context: NSManagedObjectContext) -> [Movie] {
        var movies: [Movie]? = []
        
        context.performAndWait {
            let request: NSFetchRequest<Movie> = Movie.fetchRequest()
            request.predicate = NSPredicate(format: "%K > %i", #keyPath(Movie.rating), rating)
            movies = try? context.fetch(request)
        }
        
        return movies ?? []
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

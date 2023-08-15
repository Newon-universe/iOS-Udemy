//
//  ContentView.swift
//  MovieAppUsingFR
//
//  Created by Kim Yewon on 2023/08/14.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(fetchRequest: Movie.byRating)
    var movies: FetchedResults<Movie>
    
    @State private var movieName = ""
    
    var body: some View {
        NavigationView {
            VStack {
                
                HStack {
                    TextField("Movie name", text: $movieName)
                        .textFieldStyle(.roundedBorder)
                    Button("Add Movie") {
                        let movie = Movie(context: viewContext)
                        movie.title = movieName
                        movie.rating = Int16.random(in: 1...5)
                        try? viewContext.save()
                        movieName = ""
                    }
                }
                
                List(movies, id: \.self) {movie in
                    HStack {
                        Text(movie.title ?? "")
                        Spacer()
                        HStack {
                            Text("\(movie.rating)")
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                        }
                    }
                }
                .listStyle(.plain)
                .navigationTitle("Movies")
            }
            .padding()
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, CoreDataManager.shared.viewContext)
    }
}

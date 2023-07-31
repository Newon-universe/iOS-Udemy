//
//  ContentView.swift
//  HelloCoreData
//
//  Created by Kim Yewon on 2022/12/04.
//

import SwiftUI

struct ContentView: View {
    
    //MARK: - Properties
    // When you load view, you need to pass in the data manager
    let coreDM: CoreDataManager
    @State private var movieName: String = ""
    @State private var movies: [Movie] = [Movie]()
    @State private var needsRefresh: Bool = false

    //MARK: - Function
    
    //MARK: - Body    
    fileprivate func populateMovies() {
        movies = coreDM.getAllMovies()
    }
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Enter movie name", text: $movieName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button("Save") {
                    coreDM.saveMovie(title: movieName)
                    populateMovies()
                }
                
                Spacer()
                
                List {
                    ForEach(movies, id: \.self) { movie in
                        NavigationLink {
                            MovieDetailView(coreDM: coreDM,movie: movie, needsRefresh: $needsRefresh)
                        } label: {
                            Text(movie.title ?? "")
                        }
                    }
                    // onDelete modifier is contained only in ForEach,
                    // and it help you delete items by scrolling left.
                    .onDelete { indexSet in
                        indexSet.forEach { index in
                            let movie = movies[index]
                            coreDM.deleteMovie(movie: movie)
                            populateMovies()
                        }
                    }
                }
                .listStyle(PlainListStyle())
                .tint(needsRefresh ? .white : .black)
            }
            .padding()
            .onAppear {
                populateMovies()
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(coreDM: CoreDataManager())
    }
}

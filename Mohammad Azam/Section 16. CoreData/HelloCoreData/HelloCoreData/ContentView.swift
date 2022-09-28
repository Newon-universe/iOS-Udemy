//
//  ContentView.swift
//  HelloCoreData
//
//  Created by Kim Yewon on 2022/09/28.
//

import SwiftUI

struct ContentView: View {
    
    //MARK: - Properties
    @State private var movieTitle: String = ""
    // Not a good idea to use state to populate data from third party call
    // actual data should be in ViewModel
    @State private var movies: [Movie] = [Movie]()
    @State private var needRefresh: Bool = false
    let coreDM: CoreDataManager
    
    //MARK: - Func
    private func populateMovies() {
        movies = coreDM.getAllMovies()
    }
    
    //MARK: - Body
    var body: some View {
        NavigationView {
            VStack {
                TextField("Enter title", text: $movieTitle)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button {
                    coreDM.saveMovie(title: movieTitle)
                    populateMovies()
                    movieTitle = ""
                } label: {
                    Text("Save")
                }
                
                List {
                    ForEach(movies, id: \.self) { movie in
                        NavigationLink {
                            MovieDetail(movie: movie, coreDM: coreDM, needRefresh: $needRefresh)
                        } label: {
                            Text(movie.title ?? "")
                        }
                    }
                    .onDelete { IndexSet in
                        IndexSet.forEach { index in
                            let movie = movies[index]
                            // delete it using Core Data Manager
                            coreDM.deleteMovie(movie: movie)
                            populateMovies()
                        }
                    }
                }
                .listStyle(PlainListStyle())
                .tint(needRefresh ? .white : .black)
                
                Spacer()
            } //: VStack
            .padding()
            .navigationTitle("Movies")
            .onAppear {
                populateMovies()
            }
            
        } //: NavigationVIew
    }
}

//MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(coreDM: CoreDataManager())
    }
}

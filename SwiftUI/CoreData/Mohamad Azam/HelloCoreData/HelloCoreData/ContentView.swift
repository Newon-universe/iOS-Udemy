//
//  ContentView.swift
//  HelloCoreData
//
//  Created by Kim Yewon on 2023/08/08.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var coreDM: CoreDataManager
    @State private var movieName: String = ""
    @State private var movies: [Movie] = [Movie]()
    @State private var needsRefresh: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Enter movie name", text: $movieName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button {
                    saveMovie(title: movieName)
                } label: {
                    Text("Save")
                }
                
                List {
                    ForEach(movies, id: \.self) { movie in
                        NavigationLink {
                            MovieDetailView(movie: movie, needsRefresh: $needsRefresh)
                                .environmentObject(coreDM)
                        } label: {
                            Text(movie.title ?? "")
                        }
                    }
                    .onDelete { indexSet in
                        indexSet.forEach { index in
                            let movie = movies[index]
                            coreDM.deleteMove(movie: movie)
                            populateMovies()
                        }
                    }
                }
                .listStyle(.plain)
                

                Spacer()
            }
            .padding()
            .onAppear {
                populateMovies()
            }
            .onChange(of: needsRefresh) { _ in
                if needsRefresh {
                    populateMovies()
                    needsRefresh.toggle()
                }
            }
        }
    }
    
    private func populateMovies() {
        movies = coreDM.getAllMovies()
    }
    
    private func saveMovie(title: String) {
        coreDM.saveMovie(title: title)
        populateMovies()
        movieName = ""
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

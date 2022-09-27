//
//  MoviesApp.swift
//  LazyGrid
//
//  Created by Kim Yewon on 2022/09/21.
//

import SwiftUI

struct MoviesApp: View {
    
    @ObservedObject var store: MovieStore
    
    
    let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 3)
    
    var body: some View {
        
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns) {
                    
                    ForEach(store.movies ?? [Movie](), id: \.imdbID) { movie in
                        
                        NavigationLink(destination: Text(movie.title)) {
                            VStack {
                                URLImage(url: movie.poster)
                                    .frame(width: 100, height: 150)
                                Text(movie.title)
                                    .frame(maxHeight: .infinity, alignment: .top)
                            }                            
                        }
                        
                    }
                    
                }//: LazyVGrid
                .onAppear {
                    store.getAll()
                }
            }
            .navigationTitle("Movies")
        }
        
    }
}

struct MoviesApp_Previews: PreviewProvider {
    static var previews: some View {
        MoviesApp(store: MovieStore())
    }
}

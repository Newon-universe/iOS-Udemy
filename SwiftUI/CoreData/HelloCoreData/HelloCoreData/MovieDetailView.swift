//
//  MovieDetailView.swift
//  HelloCoreData
//
//  Created by Kim Yewon on 2022/12/04.
//

import SwiftUI

struct MovieDetailView: View {
    
    let coreDM: CoreDataManager
    let movie: Movie
    @Binding var needsRefresh: Bool
    @State private var movieName: String = ""
    
    
    var body: some View {
        VStack {
            TextField(movie.title ?? "", text: $movieName)
//                .textFieldStyle(PlainTextFieldStyle())
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button("Update") {
                if !movieName.isEmpty {
                    movie.title = movieName
                }
                coreDM.updateMovie()
                needsRefresh.toggle()
            }
        }
        .padding()
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        let coreDM = CoreDataManager()
        let movie = Movie(context: coreDM.persistentContainer.viewContext)

        MovieDetailView(coreDM: coreDM, movie: movie, needsRefresh: .constant(false))
    }
}

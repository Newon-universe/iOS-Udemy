//
//  MovieDetail.swift
//  HelloCoreData
//
//  Created by Kim Yewon on 2023/08/08.
//

import SwiftUI

struct MovieDetailView: View {
    
    let movie: Movie
    @EnvironmentObject var coreDM: CoreDataManager
    @Environment(\.presentationMode) var presentationMode
    @State private var movieTitle = ""
    @Binding var needsRefresh: Bool
    
    var body: some View {
        VStack {
            TextField("", text: $movieTitle)
                .textFieldStyle(.plain)
            
            Button {
                if !movieTitle.isEmpty {
                    movie.title = movieTitle
                    coreDM.updateMovie()
                    presentationMode.wrappedValue.dismiss()
                    needsRefresh.toggle()
                }
            } label: {
                Text("Update")
            }

        }
        .onAppear {
            movieTitle = movie.title ?? ""
        }
    }
}

//struct MovieDetail_Previews: PreviewProvider {
//    static var previews: some View {
//        let coreDM = CoreDataManager()
//        let movie = Movie(context: coreDM.persistentContainer.viewContext)
//
//        MovieDetailView(movie: movie)
//    }
//}

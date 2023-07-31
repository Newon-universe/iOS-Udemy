//
//  MovieDetail.swift
//  HelloCoreData
//
//  Created by Kim Yewon on 2022/09/28.
//

import SwiftUI

struct MovieDetail: View {
    //MARK: - Properties
    @State private var movieName: String = ""
    let movie: Movie
    let coreDM: CoreDataManager
    @Binding var needRefresh: Bool
    
    
    //MARK: - Body
    
    var body: some View {
        VStack {
            TextField(movie.title ?? "", text: $movieName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Button {
                if !movieName.isEmpty {
                    movie.title = movieName
                    coreDM.updateMovie()
                    needRefresh.toggle()
                }
            } label: {
                Text("Update")
            }

        }
    }
}

//MARK: - Preview
struct MovieDetail_Previews: PreviewProvider {
    static var previews: some View {
        let movie = Movie()
        MovieDetail(movie: movie, coreDM: CoreDataManager(), needRefresh: .constant(false))
    }
}


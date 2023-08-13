//
//  ActorDetailsScreen.swift
//  MovieApp
//
//  Created by Kim Yewon on 2023/08/13.
//

import SwiftUI

struct ActorDetailsScreen: View {
    
    let `actor`: ActorViewModel
    
    var body: some View {
        VStack {
            List(`actor`.movies, id: \.movieId) { movie in
                MovieCell(movie: movie)
            }.listStyle(.plain)
        }
        .navigationTitle(actor.name)
    }
}

struct ActorDetailsScreen_Previews: PreviewProvider {
    static var previews: some View {
        let actorVM = ActorViewModel(actor: Actor(context: Actor.viewContext))
        ActorDetailsScreen(actor: actorVM)
    }
}

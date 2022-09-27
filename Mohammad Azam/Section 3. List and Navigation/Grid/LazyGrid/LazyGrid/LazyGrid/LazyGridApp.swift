//
//  LazyGridApp.swift
//  LazyGrid
//
//  Created by Kim Yewon on 2022/09/21.
//

import SwiftUI
import Combine

@main
struct LazyGridApp: App {
    
    @StateObject var store = MovieStore()
    
    var body: some Scene {
        WindowGroup {
            MoviesApp(store: store)
        }
    }
}

class Timer: ObservableObject {
    @Published var value: Int = 0
    
    init() {
        
    }
}

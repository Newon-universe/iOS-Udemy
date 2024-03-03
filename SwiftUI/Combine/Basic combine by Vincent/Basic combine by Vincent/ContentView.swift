//
//  ContentView.swift
//  Basic combine by Vincent
//
//  Created by Kim Yewon on 1/19/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .onAppear {
            run()
        }
    }
}

#Preview {
    ContentView()
}

//
//  ContentView.swift
//  csvTest
//
//  Created by Kim Yewon on 2023/12/05.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Button {
            createCSV(dataArray: dataArray)
        } label: {
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Hello, world!")
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

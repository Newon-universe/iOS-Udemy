//
//  StateObject.swift
//  New in SwiftUI
//
//  Created by Kim Yewon on 2022/09/29.
//

import SwiftUI

class Counter: ObservableObject {
    @Published var value: Int = 0
}

struct CounterView: View {
    
    @StateObject var counter = Counter()
    
    var body: some View {
        VStack {
            Text("\(counter.value)")
            Button {
                counter.value += 1
            } label: {
                Text("Counter View Invrement")
            }
        }
        .padding()
        .background(.green)
    }
    
}

struct StateObjectView: View {
    
    @State private var count: Int = 0
    
    var body: some View {
        VStack {
            Text("Content View")
            Text("\(count)")
            Button {
                count += 1
            } label: {
                Text("Increment ContentView Counter")
            }

            CounterView()
        }
        .padding()
        .background(.yellow)
        
    }
}

struct StateObject_Previews: PreviewProvider {
    static var previews: some View {
        StateObjectView()
    }
}

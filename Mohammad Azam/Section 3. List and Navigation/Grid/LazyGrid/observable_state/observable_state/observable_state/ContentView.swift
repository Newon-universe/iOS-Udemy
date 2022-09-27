//
//  ContentView.swift
//  observable_state
//
//  Created by Kim Yewon on 2022/09/22.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var userSettings: UserSettings
    
    @ObservedObject var viewModel = CounterViewModel()
    
    @Binding var a: Int
    
    var body: some View {
        VStack {
            Text("Count is \(viewModel.count)")
            Button("Increment Counter") {
                viewModel.incrementCounter()
            }
        }
    }
}

struct RandomNumberView: View {
    @State var randomNumber = 0
    
    var body: some View {
        VStack {
            Text("Random number is \(randomNumber)")
            Button("Randomize number") {
                randomNumber = (0..<1000).randomElement()!
            }
            .padding(.bottom)
            
            ContentView()
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RandomNumberView()
    }
}


final class CounterViewModel: ObservableObject {
    private(set) var count = 0
    
    func incrementCounter() {
        count += 1
        objectWillChange.send()
    }
}

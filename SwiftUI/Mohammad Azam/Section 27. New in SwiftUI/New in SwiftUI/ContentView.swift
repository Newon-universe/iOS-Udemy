//
//  ContentView.swift
//  New in SwiftUI
//
//  Created by Kim Yewon on 2022/09/29.
//

import SwiftUI

struct ContentView: View {
    
    @State private var rate: Int? = 0
    
    var body: some View {
        
        PreventingKeyboardToCoverViewPractice()
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

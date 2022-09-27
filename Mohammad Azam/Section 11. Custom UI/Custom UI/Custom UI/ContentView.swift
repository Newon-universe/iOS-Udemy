//
//  ContentView.swift
//  Custom UI
//
//  Created by Kim Yewon on 2022/09/27.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 30) {
            Circle()
                .fill(.red)
                .frame(width: 200, height: 200)
            
            Circle()
                .stroke(.green, lineWidth: 20)
            
            Rectangle()
                .fill(.yellow)
                .frame(width: 100, height: 100)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

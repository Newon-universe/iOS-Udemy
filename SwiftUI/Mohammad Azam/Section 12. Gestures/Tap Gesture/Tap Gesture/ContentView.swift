//
//  ContentView.swift
//  Tap Gesture
//
//  Created by Kim Yewon on 2022/09/27.
//

import SwiftUI

struct ContentView: View {
    
    @State private var tapped: Bool = false
    @State private var dragState: CGSize = CGSize.zero
    @State private var cardRotate: Double = 0

    
    var body: some View {
        Card(tapped: $tapped)
            .animation(.spring(), value: tapped)
            .animation(.spring(), value: dragState)
            .rotationEffect(Angle(degrees: cardRotate))
            .gesture(
                TapGesture(count: 1).onEnded { _ in
                    tapped.toggle()
                }
            )
            .offset(y: dragState.height)
            .gesture(
                DragGesture()
                    .onChanged { value in
                        dragState = value.translation
                    }
                    .onEnded{ value in
                        dragState = CGSize.zero
                    }
            )
            .gesture(
                RotationGesture()
                    .onChanged { value in
                        self.cardRotate = value.degrees
                    }
            )
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

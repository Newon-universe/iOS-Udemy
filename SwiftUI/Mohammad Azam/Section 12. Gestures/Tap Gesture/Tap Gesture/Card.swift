//
//  Card.swift
//  Tap Gesture
//
//  Created by Kim Yewon on 2022/09/27.
//

import SwiftUI

struct Card: View {
    
    @Binding var tapped: Bool
    @State private var imageScale: CGFloat = 1
    
    var body: some View {
        VStack {
            Image("cat")
                .resizable()
                .scaleEffect(self.imageScale)
                .frame(width: 300, height: 300)
                .gesture(
                    MagnificationGesture()
                        .onChanged { value in
                            self.imageScale = value.magnitude
                        }
                    
                )
                
            Text("Card")
                .font(.largeTitle)
                .foregroundColor(.white)
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(tapped ? .orange : .purple)
        .cornerRadius(30)
    }
}

struct Card_Previews: PreviewProvider {
    static var previews: some View {
        Card(tapped: Binding<Bool>.constant(true))
    }
}

//
//  BuoyView.swift
//  Make some waves
//
//  Created by Kim Yewon on 2022/11/27.
//

import SwiftUI

struct BuoyView: View {
    
    @Binding var tiltForwardBackward: Bool
    @Binding var upAndDown: Bool
    @Binding var leadingAnchowAnimate: Bool
    @State private var red = 1.0
    @State private var green = 1.0
    @State private var blue = 1.0
    let cornerRadius = 8.0
    
    var body: some View {
        ZStack {
            Image("buoy")
                .overlay(
                    Rectangle()
                        .overlay(
                            Color(red: red, green: green, blue: blue)
                        )
                        .frame(width: 12, height: 17)
                        .padding(.bottom, cornerRadius)
                        .cornerRadius(cornerRadius)
                        .padding(.bottom, -cornerRadius)
                        .position(x: 112.5, y: 19.5)
                )
                .animation(.easeOut(duration: 1).repeatForever(autoreverses: true), value: red)
                .rotationEffect(.degrees(leadingAnchowAnimate ? 7 : -3), anchor: .leading)
                .animation(.easeOut(duration: 0.9).repeatForever(autoreverses: true), value: leadingAnchowAnimate)
                .rotationEffect(.degrees(tiltForwardBackward ? -20 : 15))
                .animation(.easeOut(duration: 1).delay(0.2).repeatForever(autoreverses: true), value: tiltForwardBackward)
                .offset(y: upAndDown ? -10 : 10)
            
        }
        .onAppear {
            leadingAnchowAnimate.toggle()
            tiltForwardBackward.toggle()
            upAndDown.toggle()
            red = 0.5
            green = 0.5
            blue = 0.5
        }
    }
}

struct BuoyView_Previews: PreviewProvider {
    static var previews: some View {
        BuoyView(tiltForwardBackward: .constant(true), upAndDown: .constant(true), leadingAnchowAnimate: .constant(true))
    }
}

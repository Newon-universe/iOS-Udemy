//
//  WormGearView.swift
//  Gear Up
//
//  Created by Kim Yewon on 2022/11/19.
//

import SwiftUI

struct WormGearView: View {
    
    @State private var rect1 = false
    @State private var rect2 = false
    @State private var rect3 = false
    @State private var rect4 = false
    
    var body: some View {
        //MARK: - WORM GEAR
        ZStack {
            ZStack {
                Image("wormGear")
                    .resizable()
                    .frame(width: 100, height: 75)
                
                //MARK: - RECTANGELS FOR THE TURNING EFFECT
                HStack {
                    Rectangle()
                        .modifier(RectModifiers())
                        .opacity(rect1 ? 0 : 0.3)
                        .offset(x: 2, y: rect1 ? 14 : -8)
                        .animation(
                            .easeInOut(duration: 0.5)
                            .repeatForever(autoreverses: true),
                            value: rect1
                        )
                        .rotationEffect(.degrees(-4), anchor: .top)
                        .onAppear {
                            rect1.toggle()
                        }
                    
                    Rectangle()
                        .modifier(RectModifiers())
                        .opacity(rect2 ? 0 : 0.3)
                        .offset(x: 7, y: rect2 ? -15 : -8)
                        .animation(
                            .easeInOut(duration: 0.5)
                            .repeatForever(autoreverses: true),
                            value: rect2
                        )
                        .rotationEffect(.degrees(-4), anchor: .top)
                        .onAppear {
                            rect2.toggle()
                        }
                    
                    Rectangle()
                        .modifier(RectModifiers())
                        .opacity(rect3 ? 0 : 0.3)
                        .offset(x: 5, y: rect3 ? -5 : -10)
                        .animation(
                            .easeInOut(duration: 0.5)
                            .repeatForever(autoreverses: true),
                            value: rect3
                        )
                        .rotationEffect(.degrees(-4), anchor: .top)
                        .onAppear {
                            rect3.toggle()
                        }
                    
                    Rectangle()
                        .modifier(RectModifiers())
                        .opacity(rect4 ? 0 : 0.3)
                        .offset(x: 4, y: rect4 ? -10 : -10)
                        .animation(
                            .easeInOut(duration: 0.5)
                            .repeatForever(autoreverses: true),
                            value: rect4
                        )
                        .rotationEffect(.degrees(-4), anchor: .top)
                        .onAppear {
                            rect4.toggle()
                        }
                }
            }//: ZStack
            .shadow(color: .black, radius: 0.4, x: 0.0, y: 1)
        }
    }
}

struct RectModifiers: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 4, height: 40)
            .foregroundColor(.black)
            .cornerRadius(5)
    }
}

struct WormGearView_Previews: PreviewProvider {
    static var previews: some View {
        WormGearView()
    }
}


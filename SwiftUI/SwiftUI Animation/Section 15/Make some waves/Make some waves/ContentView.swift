//
//  ContentView.swift
//  Make some waves
//
//  Created by Kim Yewon on 2022/11/27.
//

import SwiftUI

struct ContentView: View {
    
    @State private var animateOFfset = false
    @State private var tiltForwardBackward = false
    @State private var upAndDown = false
    @State private var leadingAnchorAniate = false
    
    var body: some View {
        
        ZStack {
            //MARK: - BACKGROUND
            Color.blue
                .opacity(0.5)
                .edgesIgnoringSafeArea(.all)
            
            //MARK: - WAVE 1
            WaveCreation(
                animateOffset: $animateOFfset,
                curveOne: 0.05,
                curveTwo: -0.05,
                radius: 50,
                shadowX: 0,
                shadowY: 50,
                duration: 5.0
            )
            .opacity(0.8)
            .offset(y: 405)
            
            //MARK: - BUOY
            BuoyView(tiltForwardBackward: $tiltForwardBackward, upAndDown: $upAndDown, leadingAnchowAnimate: $leadingAnchorAniate)
            
            //MARK: - WAVE 2
            WaveCreation(
                animateOffset: $animateOFfset,
                curveOne: 0.07,
                curveTwo: -0.07,
                radius: 100,
                shadowX: 0,
                shadowY: 10,
                duration: 4.0
            )
            .offset(y: 450)
            
            WaveCreation(
                animateOffset: $animateOFfset,
                curveOne: 0.1,
                curveTwo: -0.1,
                radius: 30,
                shadowX: 0,
                shadowY: 0,
                duration: 3.7
            )
            .offset(y: 535)
            
            WaveCreation(
                animateOffset: $animateOFfset,
                curveOne: 0.14,
                curveTwo: -0.1,
                radius: 70,
                shadowX: 0,
                shadowY: 10,
                duration: 3.5
            )
            .offset(y: 605)
            
            WaveCreation(
                animateOffset: $animateOFfset,
                curveOne: 0.05,
                curveTwo: -0.05,
                radius: 50,
                shadowX: 0,
                shadowY: 50,
                duration: 5.0
            )
            .offset(y: 670)
            
            WaveCreation(
                animateOffset: $animateOFfset,
                curveOne: -0.05,
                curveTwo: 0.08,
                radius: 50,
                shadowX: 0,
                shadowY: 20,
                duration: 3.4
            )
            .offset(y: 800)
        }
        .onAppear {
            animateOFfset.toggle()
            playSound(name: "buoyBells", type: "m4a")
        }
        .onDisappear {
            audioPlayer?.stop()
        }
        
    }
}

struct WaveCreation: View {
    @Binding var animateOffset: Bool
    var curveOne: CGFloat
    var curveTwo: CGFloat
    var radius: CGFloat
    var shadowX: CGFloat
    var shadowY: CGFloat
    var duration: Double
    
    var body: some View {
        WaveView(yOffset: animateOffset ? curveOne : curveTwo)
            .fill(.blue)
            .shadow(color: .gray, radius: radius, x: shadowX, y: shadowY)
            .animation(
                .easeInOut(duration: duration).repeatForever(autoreverses: true),
                value: animateOffset
            )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

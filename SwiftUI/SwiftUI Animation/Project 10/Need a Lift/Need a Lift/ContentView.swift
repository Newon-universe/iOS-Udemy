//
//  ContentView.swift
//  Need a Lift
//
//  Created by Kim Yewon on 2022/11/16.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Elevator()
    }
}

struct Elevator: View {
    
    @State private var doorsOpened = false
    @State private var floor1 = false
    @State private var floor2 = false
    @State private var animateSmiley = false
    @State private var floorCountDirection = false
    
    @State private var doorOpenTimer: Timer? = nil
    @State private var chimesSoundTimer: Timer? = nil
    @State private var doorsOpenCloseSoundTimer: Timer? = nil
    
    let backgroundColor = Color(UIColor.black)
    
    func openDoors() {
        doorOpenTimer = Timer.scheduledTimer(withTimeInterval: 8, repeats: false) { _ in
            doorsOpened.toggle()
        }
    }
    
    func playChimeSound() {
        chimesSoundTimer = Timer.scheduledTimer(withTimeInterval: 5.5, repeats: false) { _ in
            playSound(sound: "elevatorChime", type: "m4a")
        }
    }
    
    func playDoorOpenCloseSound(interval: TimeInterval) {
        doorsOpenCloseSoundTimer = Timer.scheduledTimer(withTimeInterval: interval, repeats: false) { _ in
            playSound(sound: "doorsOpenClose", type: "m4a")
        }
    }
    
    func stopTimer() {
        doorOpenTimer?.invalidate()
        doorOpenTimer = nil
        
        chimesSoundTimer?.invalidate()
        chimesSoundTimer = nil
        
        doorsOpenCloseSoundTimer?.invalidate()
        doorsOpenCloseSoundTimer = nil
    }
    
    func floorNumbers() {
        // light up floor 1 as soon as the button is pressed, making sure floor 2 is not trye first
        
        if !floor2 {
            floor1.toggle()
        }
        
        if !doorsOpened {
            animateSmiley.toggle()
            openDoors()
            playChimeSound()
            
            // going up
            if floorCountDirection {
                withAnimation(.default.delay(4.0)) {
                    floor1 = false
                    floor2 = true
                }
                
                withAnimation(.default.delay(5.0)) {
                    floor1 = true
                    floor2 = false
                    playDoorOpenCloseSound(interval: 8.5)
                }
                // going down
            } else if !floorCountDirection {
                withAnimation(.default.delay(4.0)) {
                    floor1 = true
                    floor2 = false
                    playDoorOpenCloseSound(interval: 8.5)
                }
                
                withAnimation(.default.delay(5.0)) {
                    floor1 = false
                    floor2 = true
                }
            }
        }
    }
    
    var body: some View {
        ZStack {
            backgroundColor.edgesIgnoringSafeArea(.all)
            
            //MARK: - SMILEY
            Image("smiley")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .scaleEffect(animateSmiley ? 1 : 0.01, anchor: .bottom)
                .animation(
                    .spring(response: 0.4, dampingFraction: 0.4).delay(2.5),
                    value: animateSmiley
                )
            
            //MARK: - FRAME AND DOORS
            FrameAndDoorsView(doorsOpend: $doorsOpened)
            
            //MARK: - BUTTON
            GeometryReader { geo in
                Button {
                    stopTimer()
                    playDoorOpenCloseSound(interval: 0.5)
                    animateSmiley.toggle()
                    doorsOpened.toggle()
                    floorCountDirection.toggle()
                    floorNumbers()
                } label: {
                    HStack(spacing: 8) {
                        if !doorsOpened {
                            Circle()
                                .frame(width: 10, height: 10)
                                .foregroundColor(.white)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 30)
                                        .stroke(Color.red, lineWidth: 1)
                                )
                        } else {
                            Circle()
                                .frame(width: 10, height: 10)
                                .foregroundColor(.black)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 30)
                                        .stroke(Color.red, lineWidth: 1)
                                )
                        }
                    }
                    .padding(5)
                    .background(.black)
                    .cornerRadius(30)
                    .padding(8)
                }
                .position(x: geo.size.width / 33, y: geo.size.height / 2)
                //                .offset(x: geo.size.width / 33, y: geo.size.height / 2)
                
                //MARK: - FLOOR NUMBERS
                HStack {
                    Image(systemName: "1.circle")
                        .foregroundColor(.black)
                        .opacity(floor1 ? 1 : 0.3)
                    Image(systemName: "2.circle")
                        .foregroundColor(.black)
                        .opacity(floor2 ? 1 : 0.3)
                }
                .position(x: geo.size.width / 2 , y: geo.size.height * 0.02 + 2)
                .font(.system(size: 25))
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 12")
            .previewDisplayName("iPhone 12")
        
        //        ContentView()
        //            .previewDevice("iPad Pro (9.7-inch)")
        //            .previewDisplayName("iPad Pro (9.7-inch)")
        //            .previewInterfaceOrientation(.portraitUpsideDown)
    }
}

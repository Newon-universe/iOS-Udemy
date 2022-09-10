//
//  MotionAnimationview.swift
//  Africa
//
//  Created by Kim Yewon on 2022/09/10.
//

import SwiftUI

struct MotionAnimationView: View {
    //MARK: - PROPERTIES
    
    @State private var randomCircle = Int.random(in: 12...16)
    @State private var isAnimating: Bool = false
    
    //MARK: - FUNCTIONS
    
    // 1. Random Coordinate
    func randomCoordinate(max: CGFloat) -> CGFloat {
        return CGFloat.random(in: 0...max)
    }
    
    // 2. Random Size
    func randomSize() -> CGFloat {
        return CGFloat(Int.random(in: 10...300))
    }
    
    // 3. Random Scale
    func randomScale() -> CGFloat {
        return CGFloat(Double.random(in: 0.1...2.0))
    }
    
    // 4. Random Speed
    func randomSpeed() -> Double {
        return Double.random(in: 0.025 ... 1.0)
    }
    
    // 5. Random Delay
    func randomDelay() -> Double {
        return Double.random(in: 0...2)
    }
    
    //MARK: - BODY
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ForEach(0...randomCircle, id: \.self) { item in
                    Circle()
                        .foregroundColor(.gray)
                        .opacity(0.15)
                        .frame(width: randomSize(), height: randomSize(), alignment: .center)
                        .scaleEffect(isAnimating ? randomScale() : 1)
                        .position(
                            x: randomCoordinate(max: geometry.size.width),
                            y: randomCoordinate(max: geometry.size.height)
                        )
                    //                        .animation(
                    //                            Animation.interpolatingSpring(stiffness: 0.5, damping: 0.5)
                    //                                .repeatForever()
                    //                                .speed(2)
                    //                                .delay(1)
                    //                        )
                        .animation(
                            Animation.interpolatingSpring(
                                stiffness: 0.5, damping: 0.5
                            )
                            .repeatForever()
                            .speed(randomSpeed())
                            .delay(randomDelay())
                            , value: isAnimating)
                        .onAppear {
                            isAnimating = true
                        }
                } //: LOOP
            }//: ZStack
            .drawingGroup() // GPU use method
        }
    }
}

//MARK: - PREVIEW


struct MotionAnimationview_Previews: PreviewProvider {
    static var previews: some View {
        MotionAnimationView()
    }
}

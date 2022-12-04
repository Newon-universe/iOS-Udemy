//
//  WaveView.swift
//  Make some waves
//
//  Created by Kim Yewon on 2022/11/27.
//

import SwiftUI

struct WaveView: Shape {
    
    var yOffset: CGFloat = 0.0
    
    var animatableData: CGFloat {
        get { yOffset }
        set { yOffset = newValue }
    }
    
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: .zero)
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
        path.addCurve(
            to: CGPoint(x: rect.minX, y: rect.minY),
            control1: CGPoint(x: rect.maxX * 0.45, y: rect.minY - (rect.maxY * yOffset)),
            control2: CGPoint(x: rect.maxX * 0.45, y: rect.maxY * yOffset)
        )
        // addCurve follows 베지에곡선
        
        
        return path
    }
    
}

struct WaveView_Previews: PreviewProvider {
    static var previews: some View {
        
        Group {
            WaveView(yOffset: 0.7)
                .stroke(.blue, lineWidth: 3)
                .frame(height: 250)
                .padding()
                .previewDisplayName("Wave")
        }
    }
}

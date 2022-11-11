//
//  PetalView.swift
//  Brething Flower
//
//  Created by Kim Yewon on 2022/11/10.
//

import SwiftUI

struct PetalView: View {
    
    @Binding var petal: Bool
    var degrees: Double = 0.0
    
    var body: some View {
        Image("petal")
            .resizable()
            .frame(width: 75, height: 125)
            .rotationEffect(.degrees(petal ? degrees : degrees), anchor: .bottom)
            .animation(
                .easeInOut(duration: 2)
                .repeatForever(autoreverses: true)
                , value: petal)
    }
}

struct PetalView_Previews: PreviewProvider {
    static var previews: some View {
        PetalView(petal: .constant(true))
    }
}

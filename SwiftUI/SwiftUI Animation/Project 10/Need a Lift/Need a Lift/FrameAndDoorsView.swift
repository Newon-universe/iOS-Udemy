//
//  FrameAndDoorsView.swift
//  Need a Lift
//
//  Created by Kim Yewon on 2022/11/16.
//

import SwiftUI

struct FrameAndDoorsView: View {
    
    @Binding var doorsOpend: Bool
    
    var body: some View {
        ZStack {
            GeometryReader { geo in
                
                HStack {
                    Image("leftDoor")
                        .resizable()
                        .frame(maxWidth: geo.size.width)
                        .offset(x: doorsOpend ? -geo.size.width / 2 : 4)
                    
                    Image("rightDoor")
                        .resizable()
                        .frame(maxWidth: geo.size.width)
                        .offset(x: doorsOpend ? geo.size.width / 2 : -4)
                }
                
                Image("doorFrame")
                    .resizable()
                    .frame(maxWidth: geo.size.width, maxHeight: geo.size.height)
                
            }
            .animation(.easeInOut.speed(0.09).delay(0.3), value: doorsOpend)
        }
    }
}

struct FrameAndDoorsView_Previews: PreviewProvider {
    static var previews: some View {
        FrameAndDoorsView(doorsOpend: .constant(false))
    }
}

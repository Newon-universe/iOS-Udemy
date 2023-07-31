//
//  GearShaftView.swift
//  Gear Up
//
//  Created by Kim Yewon on 2022/11/20.
//

import SwiftUI

struct GearShaftView: View {
    
    @State var animateRect: Bool = false
    
    var body: some View {
        ZStack {
            ZStack {
                Image("shaft")
                    .resizable()
                    .frame(width: 160, height: 40)
                    
                Rectangle()
                    .frame(width: 140, height: 8)
                    .foregroundColor(.black)
                    .cornerRadius(5)
                    .opacity(animateRect ? 0 : 0.5)
                    .animation(
                        .easeInOut(duration: 0.5)
                        .repeatForever(autoreverses: true),
                        value: animateRect
                    )
                    .onAppear {
                        animateRect.toggle()
                    }
                    .offset(x: 0, y: -7)
            }
        }
    }
}

struct GearShaftView_Previews: PreviewProvider {
    static var previews: some View {
        GearShaftView()
    }
}

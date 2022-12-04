//
//  FanView.swift
//  Gear Up
//
//  Created by Kim Yewon on 2022/11/20.
//

import SwiftUI

struct FanView: View {
    @State var rotateFan = false
    var degrees: Double = 360 * 4
    // 각도를 많이 주고, 시간이 한정되면 rotationEffect 를 수행하기 위해서 더 빨리 돌게됨
    
    var body: some View {
        ZStack {
            Image("fan")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200)
                .rotationEffect(.degrees(rotateFan ? degrees : 0), anchor: .center)
                .animation(
                    .linear(duration: 4)
                    .repeatForever(autoreverses: false),
                    value: rotateFan
                )
                .onAppear {
                    rotateFan.toggle()
                }
                .shadow(color: .black, radius: 15)
        }
    }
}

struct FanView_Previews: PreviewProvider {
    static var previews: some View {
        FanView()
    }
}

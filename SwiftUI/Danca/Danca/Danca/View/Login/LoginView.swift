//
//  LoginView.swift
//  Danca
//
//  Created by Kim Yewon on 2022/11/05.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        ZStack(alignment: .center) {
            Image("cover")
                .resizable()
                .scaledToFill()
                .blur(radius: 10)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .previewInterfaceOrientation(.landscapeRight)
    }
}

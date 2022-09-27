//
//  BackgroundImageView.swift
//  Devote
//
//  Created by Kim Yewon on 2022/09/13.
//

import SwiftUI

struct BackgroundImageView: View {
    //MARK: - Property
    
    //MARK: - Body
    var body: some View {
        Image("rocket")
            .antialiased(true) // keep image edge smooth
            .resizable()
            .scaledToFill()
            .ignoresSafeArea(.all)
    }
}

//MARK: - Preview
struct BackgroundImageView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundImageView()
    }
}

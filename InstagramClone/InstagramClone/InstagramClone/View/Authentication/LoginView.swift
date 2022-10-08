//
//  LoginView.swift
//  InstagramClone
//
//  Created by Kim Yewon on 2022/10/08.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(
                    gradient:
                        Gradient(colors: [.purple, .blue]),
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()
                
                VStack {
                    Image("instagram_title")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 220, height: 100)
                        .foregroundColor(.white)
                    
                    // email field
                    
                    // password field
                    
                    // forgot password
                    
                    // sign in
                    
                    // go to sign up
                    
                    Spacer()
                    
                }//: VStack
                
            }
        }
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

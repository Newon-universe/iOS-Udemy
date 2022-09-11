//
//  ContentView.swift
//  TouchDown
//
//  Created by Kim Yewon on 2022/09/11.
//

import SwiftUI

struct ContentView: View {
    //MARK: - Properties
    
    // UIWindowScene.windows.first?.safeAreaInsets.top is deprecated, so you can use this.

    let keyWindow = UIApplication.shared.connectedScenes
        .filter({$0.activationState == .foregroundActive})
        .compactMap({$0 as? UIWindowScene})
        .first?.windows
        .filter({$0.isKeyWindow}).first
    
    
    //MARK: - BODY
    
    var body: some View {
        VStack(spacing: 0) {
            
            NavigationBarView()
                .padding(.horizontal, 15)
                .padding(.bottom)
//                .padding(.top, keyWindow?.safeAreaInsets.top)
                .background(.white)
                .shadow(color: .black.opacity(0.05), radius: 5, x: 0, y: 5)
            
            ScrollView(.vertical, showsIndicators: true) {
                VStack {
                
                    FeaturedTabView()
                        .padding(.vertical)
                        .frame(height: UIScreen.main.bounds.width / 1.475)
                    
                    CategoryGridView()
                    
                    FooterView()
                        .padding(.horizontal)
                }//: VStack
            }//: Scroll
            
            Spacer()
            
        } //: VStack
        .background(colorBackgorund.ignoresSafeArea(.all, edges: .all))
        
    }
}


//MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

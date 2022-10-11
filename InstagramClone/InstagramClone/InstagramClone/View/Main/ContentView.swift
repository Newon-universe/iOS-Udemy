//
//  ContentView.swift
//  InstagramClone
//
//  Created by Kim Yewon on 2022/10/07.
//

import SwiftUI

struct ContentView: View {
    
    //MARK: - Properties
    @EnvironmentObject var viewModel: AuthViewModel
    
    //MARK: - Function
    
    //MARK: - Body
    
    
    var body: some View {
        Group {
            if viewModel.userSession == nil {
                LoginView()
            } else {
                withAnimation(.spring()) {
                    MainTabView()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

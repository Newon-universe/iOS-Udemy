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
    @State var selectedIndex = 0
    
    //MARK: - Body
    
    var body: some View {
        Group {
            if viewModel.userSession == nil {
                LoginView()
            } else {
                if let user = viewModel.currentUser {
                    withAnimation(.spring()) {
                        MainTabView(user: user, selectedIndex: $selectedIndex)
                    }
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

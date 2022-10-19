//
//  MainTabView.swift
//  InstagramClone
//
//  Created by Kim Yewon on 2022/10/07.
//

import SwiftUI

enum TabItemType: String {
    case home
    case search
    case post
    case notification
    case setting
    
    var items: Image {
        switch self {
        case .home: return Image(systemName: "house")
        case .search: return Image(systemName: "magnifyingglass")
        case .post: return Image(systemName: "plus.square")
        case .notification: return Image(systemName: "heart")
        case .setting: return Image(systemName: "person")
        }
    }
}

struct TabViewItem: View {
    var type: TabItemType
    
    var body: some View {
        type.items
    }
}

struct MainTabView: View {
        
    let user: User
    
    var body: some View {
        
        NavigationView {
            TabView {
                FeedView()
                    .tabItem { TabViewItem(type: .home) }
                
                SearchView()
                    .tabItem { TabViewItem(type: .search) }
                
                UploadPostView()
                    .tabItem { TabViewItem(type: .post) }
                
                NotificationsView()
                    .tabItem { TabViewItem(type: .notification) }
                
                ProfileView(user: user)
                    .tabItem { TabViewItem(type: .setting) }
                
            } //: TabView
            .navigationTitle("Home")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar(content: {
                logOutButton
            })
            .accentColor(.black)
        }//: NavigationView
        
    }
    
    var logOutButton: some View {
        Button {
            AuthViewModel.shared.signOut()
        } label: {
            Text("Logout")
                .foregroundColor(.black)
        }
    }
}

//struct MainTabView_Previews: PreviewProvider {
//    static var previews: some View {
//        MainTabView()
//    }
//}

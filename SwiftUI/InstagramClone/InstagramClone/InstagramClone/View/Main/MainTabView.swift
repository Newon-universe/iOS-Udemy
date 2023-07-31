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
    @Binding var selectedIndex: Int
    
    var body: some View {
        
        NavigationView {
            TabView(selection: $selectedIndex) {
                FeedView()
                    .onTapGesture {
                        selectedIndex = 0
                    }
                    .tabItem { TabViewItem(type: .home) }
                    .tag(0)
                
                SearchView()
                    .onTapGesture {
                        selectedIndex = 1
                    }
                    .tabItem { TabViewItem(type: .search) }
                    .tag(1)
                
                UploadPostView(tabIndex: $selectedIndex)
                    .onTapGesture {
                        selectedIndex = 2
                    }
                    .tabItem { TabViewItem(type: .post) }
                    .tag(2)
                
                NotificationsView()
                    .onTapGesture {
                        selectedIndex = 3
                    }
                    .tabItem { TabViewItem(type: .notification) }
                    .tag(3)
                
                ProfileView(user: user)
                    .onTapGesture {
                        selectedIndex = 4
                    }
                    .tabItem { TabViewItem(type: .setting) }
                    .tag(4)
                
            } //: TabView
            .navigationTitle(tabTitle)
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
    
    var tabTitle: String {
        switch selectedIndex {
        case 0: return "Feed"
        case 1: return "Explore"
        case 2: return "New Post"
        case 3: return "Notification"
        case 4: return "Profile"
        default: return ""
        }
    }
}

//struct MainTabView_Previews: PreviewProvider {
//    static var previews: some View {
//        MainTabView()
//    }
//}

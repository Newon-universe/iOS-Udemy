//
//  UserListView.swift
//  InstagramClone
//
//  Created by Kim Yewon on 2022/10/07.
//

import SwiftUI

struct UserListView: View {
    
    @ObservedObject var viewModel: SearchViewModel
    @Binding var searchText: String
    
    var users: [User] {
        return searchText.isEmpty ? viewModel.users : viewModel.filterUsers(searchText)
    }
    
    var body: some View {
        ScrollView {
            LazyVStack { 
                
                ForEach(users) { user in
                    NavigationLink {
                        LazyView(ProfileView(user: user))
                    } label: {
                        UserCell(user: user)
                            .id(user.id)
                            .padding(.leading)
                    }

                }
                
//                NavigationLink {
//                    ProfileView()
//                } label: {
//
//                }
            }
        }
    }
}

//
//struct UserListView_Previews: PreviewProvider {
//    static var previews: some View {
//        UserListView()
//    }
//}

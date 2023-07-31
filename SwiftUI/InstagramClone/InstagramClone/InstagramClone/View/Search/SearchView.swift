//
//  SearchView.swift
//  InstagramClone
//
//  Created by Kim Yewon on 2022/10/07.
//

import SwiftUI

struct SearchView: View {
    
    //MARK: - Properties
    @State private var searchText = ""
    @State private var isSearchMode = false
    @State private var isChange = false
    @ObservedObject var viewModel = SearchViewModel()
    
    //MARK: - Function
    
    //MARK: - Body

    
    var body: some View {
        ScrollView {
            // search bar
            SearchBar(text: $searchText, isEditing: $isSearchMode, isChange: $isChange)
                .padding()
            
            ZStack {
                if isChange {
                    UserListView(viewModel: viewModel, searchText: $searchText)
                } else {
                    PostGridView(config: .explore)
                }
            }
            
            // grid view/user list view
            
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}

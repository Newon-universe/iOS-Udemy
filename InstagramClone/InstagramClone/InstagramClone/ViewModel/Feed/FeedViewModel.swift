//
//  FeedViewModel.swift
//  InstagramClone
//
//  Created by Kim Yewon on 2022/10/21.
//

import SwiftUI

class FeedViewModel: ObservableObject {
    @Published var posts =  [Post]()
    
    init() {
        fetchPosts()
    }
    
    func postPost() {
        
    }
    
    func fetchPosts() {
        COLLECTION_POSTS.order(by: "timestamp", descending: true).getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            self.posts = documents.compactMap {
                try? $0.data(as: Post.self)
            }
            
        }
    }
}

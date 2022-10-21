//
//  SearchViewModel.swift
//  InstagramClone
//
//  Created by Kim Yewon on 2022/10/12.
//

import SwiftUI
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift
import FirebaseStorage

class SearchViewModel: ObservableObject {
    
    @Published var users = [User]()
    @Published var posts = [Post]()
    @Published var postPics = [UIImage]()
    
    init() {
        fetchUsers()
        fetchPosts()
    }
    
    func fetchUsers() {
        COLLECTION_USERS.getDocuments { [self] snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            
            self.users = documents.compactMap {
                try? $0.data(as: User.self)
            }
            
            print("Fetching")
        }
    }
    
    func fetchPosts() {
        COLLECTION_POSTS.getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            self.posts = documents.compactMap {
                try? $0.data(as: Post.self)
            }
            
        }
    }
    
    func fetchPostPics() {
        self.postPics = self.posts.compactMap { ImageDownloader.getPictureGroup(imageUrl: $0.imageUrl) }
    }
    
    
    func filterUsers(_ query: String) -> [User] {
        let lowercasedQuery = query.lowercased()
        return users.filter { $0.fullName.lowercased().contains(lowercasedQuery) || $0.userName.lowercased().contains(lowercasedQuery) }
    }
    
}

//
//  PostGridViewModel.swift
//  InstagramClone
//
//  Created by Kim Yewon on 2022/10/22.
//

import SwiftUI

enum PostGridConfiguration {
    case explore
    case profile(String)
}

class PostGridViewModel: ObservableObject {
    @Published var posts = [Post]()
    @Published var postPics = [UIImage]()
    
    let config: PostGridConfiguration
    
    init(config: PostGridConfiguration) {
        self.config = config
        fetchPosts(forConfig: config)
    }
    
    func fetchPosts(forConfig config: PostGridConfiguration) {
        switch config {
        case .explore: fetchExplorePosts()
        case .profile(let uid): fetchUserPosts(forUid: uid)
        }
    }

    func fetchExplorePosts() {
        COLLECTION_POSTS.getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            self.posts = documents.compactMap {
                try? $0.data(as: Post.self)
            }
            self.postPics = [UIImage](repeating: UIImage(systemName: "x.circle.fill")!, count: self.posts.count)
        }
    }
    
    func fetchPostPics(_ url: String, index: Int) async {
        let image = await ImageDownloader.getPictureGroup(imageUrl: url) ?? UIImage(systemName: "x.circle.fill")!
        
        DispatchQueue.main.async {
            self.postPics[index] = image
        }
    }
    
    func fetchUserPosts(forUid uid: String) {
        COLLECTION_POSTS.whereField("ownerUid", isEqualTo: uid).getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            self.posts = documents.compactMap {
                try? $0.data(as: Post.self)
            }
            self.postPics = [UIImage](repeating: UIImage(systemName: "x.circle.fill")!, count: self.posts.count)
        }
    }
}

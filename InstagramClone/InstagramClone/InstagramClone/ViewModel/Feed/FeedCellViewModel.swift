//
//  FeedCellViewModel.swift
//  InstagramClone
//
//  Created by Kim Yewon on 2022/10/22.
//

import SwiftUI

class FeedCellViewModel: ObservableObject {
    @Published var post: Post
    var postDate: Int{
        return Calendar.current.component(.day, from: Date.now) - Calendar.current.component(.day, from: post.timestamp.dateValue())
    }
    @Published var userPic = UIImage(systemName: "x.circle.fill")!
    @Published var postPic = UIImage(systemName: "x.circle.fill")!
    
    var likeString: String {
        let label = post.likes == 1 ? "like" : "likes"
        return "\(post.likes) \(label)"
    }
    
    init(post: Post) {
        self.post = post
        checkIfUserLikedPost()
    }
    
    func like() {
        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
        guard let postId = post.id else { return }
        
        COLLECTION_POSTS.document(post.id ?? "").collection("post-likes").document(uid).setData([:]) { _ in
            COLLECTION_USERS.document(uid).collection("user-likes").document(postId).setData([:]) { _ in
                
                COLLECTION_POSTS.document(postId).updateData(["likes": self.post.likes + 1])
                NotificationsViewModel.uploadNotification(toUid: self.post.ownerUid, type: .like, post: self.post)
                
                self.post.didLike = true
                self.post.likes += 1
            }
        }
        
        
    }
    
    func unlike() {
        guard post.likes > 0 else { return }
        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
        guard let postId = post.id else { return }

        COLLECTION_POSTS.document(postId).collection("post-likes").document(uid).delete { _ in
            COLLECTION_USERS.document(uid).collection("user-likes").document(postId).delete { _ in
                
                COLLECTION_POSTS.document(postId).updateData(["likes": self.post.likes - 1])
                
                self.post.didLike = false
                self.post.likes -= 1
            }
        }
    }
    
    func checkIfUserLikedPost() {
        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
        guard let postId = post.id else { return }
        
        COLLECTION_USERS.document(uid).collection("user-likes").document(postId).getDocument { snapshot, error in
            guard let didLike = snapshot?.exists else { return }
            self.post.didLike = didLike
            print(didLike)
        }
    }
}

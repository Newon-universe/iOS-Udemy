//
//  CommentViewModel.swift
//  InstagramClone
//
//  Created by Kim Yewon on 2022/10/23.
//

import Foundation
import Firebase
import SwiftUI

class CommentViewModel: ObservableObject {
    
    private let post: Post
    @Published var comments = [Comment]()
    @Published var commentsUserProfile = [UIImage]()
    
    init(post: Post) {
        self.post = post
        fetchComments()
    }
    
    func uploadComment(commentText: String) {
        guard let user = AuthViewModel.shared.currentUser else { return }
        guard let postId = post.id else { return }
        
        
        let data: [String: Any] = [
            "username": user.userName,
            "profileImageUrl": user.profileImageUrl,
            "uid": user.id ?? "",
            "timestamp": Timestamp(date: Date()),
            "postOwnerUid": postId,
            "commentText": commentText
        ]
        
        COLLECTION_POSTS.document(postId).collection("post-comments").addDocument(data: data) { error in
            if let error = error {
                print("DEBUG: Error uploading comment \(error.localizedDescription)")
                return
            }
        }
    }
    
    func fetchComments() {
        guard let postId = post.id else { return }
        
        let query = COLLECTION_POSTS.document(postId).collection("post-comments").order(by: "timestamp", descending: false)
        
        query.addSnapshotListener { snapshot, error in
            
            guard let addedDocs = snapshot?.documentChanges.filter({ $0.type == .added  }) else { return }
            self.comments.append(contentsOf: addedDocs.compactMap {
                let item = try? $0.document.data(as: Comment.self)
                
                self.commentsUserProfile.append(UIImage(systemName: "x.circle.fill")!)
                
                return item
            })
            
            func foo(){
                //            snapshot?.documentChanges.forEach { change in
                //                if change.type == .added {
                //                    guard let comment = try? change.document.data(as: Comment.self) else { return }
                //                    self.comments.append(comment)
                //
                //                    Task.init {
                //                        let image = await ImageDownloader.getPictureGroup(imageUrl: comment.profileImageUrl) ?? UIImage(systemName: "x.circle.fill")!
                //                        if image != UIImage(systemName: "x.circle.fill")! {
                //                            self.commentsUserProfile.append(image)
                //                        }
                //                    }
                //                }
                //            }
            }
        }
    }
    
    func fetchProfilePics(_ url: String, index: Int) async {
        let image = await ImageDownloader.getAsyncPicture(imageUrl: url) ?? UIImage(systemName: "x.square")!
        
        DispatchQueue.main.async {
            self.commentsUserProfile[index] = image
        }
    }
}

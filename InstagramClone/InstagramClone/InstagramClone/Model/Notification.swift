//
//  Notification.swift
//  InstagramClone
//
//  Created by Kim Yewon on 2022/10/24.
//

import FirebaseFirestoreSwift
import Firebase

enum NotificationType: Int, Decodable {
    case like
    case comment
    case follow
    
    var notificationMessage: String {
        switch self {
        case .like: return " liked one of your posts."
        case .comment: return " commented on one of your posts."
        case .follow: return " started following you."
        }
    }
}

struct Notification: Identifiable, Decodable {
    @DocumentID var id: String?
    var postId: String?
    let username: String
    let profileImageUrl: String
    let timestamp: Timestamp
    let type: NotificationType
    let uid: String
    
    var isFollowed: Bool? = false
    var post: Post?
    var user: User?
}


//
//  Comment.swift
//  InstagramClone
//
//  Created by Kim Yewon on 2022/10/23.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

struct Comment: Identifiable, Decodable {
    @DocumentID var id: String?
    let username: String
    let postOwnerUid: String
    let profileImageUrl: String
    let commentText: String
    let timestamp: Timestamp
    let uid: String
}

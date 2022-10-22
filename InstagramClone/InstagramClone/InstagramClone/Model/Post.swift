//
//  Post.swift
//  InstagramClone
//
//  Created by Kim Yewon on 2022/10/21.
//

import FirebaseFirestoreSwift
import Firebase

struct Post: Identifiable, Decodable {
    @DocumentID var id: String?
    
    let ownerUid: String
    let ownerUsername: String
    let caption: String
    var likes: Int
    let imageUrl: String
    let timestamp: Timestamp
    let ownerImageUrl: String
    
    var didLike: Bool? = false
//    private enum CodingKeys: CodingKeys {
//        case ownerUid = "uid"
//    }
}

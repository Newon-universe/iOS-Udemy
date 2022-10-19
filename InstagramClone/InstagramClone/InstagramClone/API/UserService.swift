//
//  UserService.swift
//  InstagramClone
//
//  Created by Kim Yewon on 2022/10/19.
//

import Foundation
import Firebase

struct UserService {
    static func follow(uid: String, completion: ((Error?) -> Void)?) {
        guard let currentUid = AuthViewModel.shared.userSession?.uid else { return }
        
        COLLECTION_FOLLWING.document(currentUid).collection("user-following").document(uid).setData([:]) { _ in
            COLLECTION_FOLLWERS.document(uid).collection("user-followers").document(currentUid).setData([:], completion: completion)
        }
        
    }
    
    static func unFollow() {
        
    }
    
    static func checkIfUserIsFollowed() {
        
    }
}

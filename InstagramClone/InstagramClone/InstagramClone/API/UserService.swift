//
//  UserService.swift
//  InstagramClone
//
//  Created by Kim Yewon on 2022/10/19.
//

import Foundation
import Firebase

typealias FirestoreCompletion = ((Error?) -> Void)?

struct UserService {
    static func follow(uid: String, completion: ((Error?) -> Void)?) {
        guard let currentUid = AuthViewModel.shared.userSession?.uid else { return }

        COLLECTION_FOLLWING.document(currentUid).collection("user-following").document(uid).setData([:]) { _ in
            COLLECTION_FOLLWERS.document(uid).collection("user-followers").document(currentUid).setData([:], completion: completion)
        }
        
    }

    static func unFollow(uid: String, completion: ((Error?) -> Void)?) {
        guard let currentUid = AuthViewModel.shared.userSession?.uid else { return }
        
        COLLECTION_FOLLWING.document(currentUid).collection("user-following").document(uid).delete() { _ in
            COLLECTION_FOLLWERS.document(uid).collection("user-followers").document(currentUid).delete(completion: completion)
        }
    }

    static func checkIfUserIsFollowed(uid: String, completion: @escaping (Bool) -> Void) {
        guard let currentUid = AuthViewModel.shared.userSession?.uid else { return }
        
        COLLECTION_FOLLWING.document(currentUid).collection("user-following").document(uid).getDocument { snapshot, _ in
            guard let isFollwed = snapshot?.exists else { return }
            completion(isFollwed)
        }
    }
}

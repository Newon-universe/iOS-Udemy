//
//  User.swift
//  InstagramClone
//
//  Created by Kim Yewon on 2022/10/12.
//

import Foundation
import UIKit
import FirebaseFirestoreSwift

struct User: Identifiable, Decodable {
    let userName: String
    let email: String
    let profileImageUrl: String
    let fullName: String
    let uid: String
    var isFollowed: Bool? = false
    
    @DocumentID var id: String?
    var isCurrentUser: Bool { return AuthViewModel.shared.userSession?.uid == id }
}

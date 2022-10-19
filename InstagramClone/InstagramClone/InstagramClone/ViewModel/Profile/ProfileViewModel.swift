//
//  ProfileViewModel.swift
//  InstagramClone
//
//  Created by Kim Yewon on 2022/10/19.
//

import SwiftUI

class ProfileViewModel: ObservableObject {
    @Published var user: User
    
    init(user: User) {
        self.user = user
    }
    
    func follow() {
        guard let uid = user.id else { return }
        UserService.follow(uid: uid) { _ in
            self.user.isFollowed = true
        }
    }
    
    func unfolllow() {
        print("DEBUGL Unfollow user..")
    }
    
    func checkIfUserIsFollowed() {
        
    }
}

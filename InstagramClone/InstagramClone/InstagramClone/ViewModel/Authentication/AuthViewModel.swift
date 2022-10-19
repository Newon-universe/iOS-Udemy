//
//  AuthViewModel.swift
//  InstagramClone
//
//  Created by Kim Yewon on 2022/10/11.
//

import SwiftUI
import Firebase

class AuthViewModel: ObservableObject {
    
    @Published var userSession: Firebase.User?
    @Published var currentUser: User?
    
    static let shared = AuthViewModel()
    
    init() {
        self.userSession = Auth.auth().currentUser
        fetchUser()
    }
    
    func logIn(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG, Login failed", error.localizedDescription)
                return
            }
            
            guard let user = result?.user else { return }
            self.userSession = user
            self.fetchUser()
        }
    }
    
    func signUp(
        withEmail email: String,
        password: String,
        image: UIImage?,
        fullname: String,
        username: String
    ) {
        guard let image = image else { return }
        
        ImageUploader.uploadImage(imgae: image) { imageUrl in
            Auth.auth().createUser(withEmail: email, password: password) { result, error in
                if let error = error {
                    print(error.localizedDescription)
                    return
                }
                
                guard let user = result?.user else { return }
                
                print("Successfully registered user.")
                
                let data = [
                    "email": email,
                    "userName": username,
                    "fullName": fullname,
                    "profileImageUrl": imageUrl,
                    "uid": user.uid
                ]
                
                COLLECTION_USERS.document(user.uid).setData(data) { _ in
                    print("Successfully uploaded user data")
                    self.userSession = user
                    self.fetchUser()
                }
            }
        }
        
    }
    
    func signOut() {
        self.userSession = nil
        try? Auth.auth().signOut()
    }
    
    func resetPassword() {
        
    }
    
    func fetchUser() {
        guard let uid = userSession?.uid else { return }
        
        COLLECTION_USERS.document(uid).getDocument { snapshot, _ in
            
            //MARK: - Decode 방법 찾기 :<
            
//            guard let dictionary = snapshot?.data() else { return }
//            guard let username = dictionary["userName"] as? String else { return }
//            guard let email = dictionary["email"] as? String else { return }
//            guard let profileImageUrl = dictionary["profileImageUrl"] as? String else { return }
//            guard let fullname = dictionary["fullName"] as? String else { return }
//
//            let user = User(userName: username, email: email, profileImageUrl: profileImageUrl, fullName: fullname, uid: uid as String)
//
//
//            print("DEBUG: Username is \(user.userName)")
//            print("DEBUG: Username is \(user.email)")
//            print("DEBUG: Username is \(user.uid)")
            
            guard let user = try? snapshot?.data(as: User.self) else { return }
            self.currentUser = user
            print("DEBUG: User is \(user)")
            
        }
    }
    
}


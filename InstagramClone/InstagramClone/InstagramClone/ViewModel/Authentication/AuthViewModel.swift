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
    
    static let shared = AuthViewModel()
    
    init() {
        self.userSession = Auth.auth().currentUser
    }
    
    func logIn() {
        print("Login")
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
                
                Firestore.firestore().collection("users").document(user.uid).setData(data) { _ in
                    print("Successfully uploaded user data")
                    self.userSession = user
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
        
    }
    
}


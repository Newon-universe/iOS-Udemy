//
//  SearchViewModel.swift
//  InstagramClone
//
//  Created by Kim Yewon on 2022/10/12.
//

import SwiftUI
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift
import FirebaseStorage

class SearchViewModel: ObservableObject {
    
    @Published var users = [User]()
    
    init() {
        fetchUsers()
    }
    
    func fetchUsers() {
        COLLECTION_USERS.getDocuments { [self] snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            
            self.users = documents.compactMap {
                try? $0.data(as: User.self)
            }
            
            print("Fetching")
        }
    }
    
    func filterUsers(_ query: String) -> [User] {
        let lowercasedQuery = query.lowercased()
        return users.filter { $0.fullName.lowercased().contains(lowercasedQuery) || $0.userName.lowercased().contains(lowercasedQuery) }
    }
    
    static func searchUser(_ uid: String, completion: @escaping (User?) -> Void) {
        COLLECTION_USERS.document(uid).getDocument { snapshot, _ in
            guard let user = try? snapshot?.data(as: User.self) else {
                completion(nil)
                return
            }
            
            completion(user)
        }
    }
}

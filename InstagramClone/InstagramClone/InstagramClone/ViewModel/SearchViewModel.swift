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
    
    static func getProfile(imageUrl: String, completion: @escaping (UIImage?) -> Void) {
                
        Storage.storage().reference().child(imageUrl).getData(maxSize: 5 * 1025 * 1024) { data, error in
            if error == nil && data != nil {
                let image = UIImage(data: data!)
                
                DispatchQueue.main.async {
                    completion(image)
                }
            }
        }
        
    }
    
    func filterUsers(_ query: String) -> [User] {
        let lowercasedQuery = query.lowercased()
        return users.filter { $0.fullName.lowercased().contains(lowercasedQuery) || $0.userName.lowercased().contains(lowercasedQuery) }
    }
    
}

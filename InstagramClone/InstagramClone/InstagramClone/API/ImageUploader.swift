//
//  ImageUploader.swift
//  InstagramClone
//
//  Created by Kim Yewon on 2022/10/11.
//

import UIKit
import Firebase
import FirebaseStorage

enum UploadType {
    case profile
    case post
    
    var filePath: StorageReference {
        let fileName = NSUUID().uuidString
        switch self {
        case .profile: return Storage.storage().reference(withPath: "/profile_images/\(fileName).jpg")
        case .post: return Storage.storage().reference(withPath: "/post_images/\(fileName).jpg")
        }
    }
}

struct ImageUploader {
    static func uploadImage(imgae: UIImage, type: UploadType, completion: @escaping(String) -> Void) {
        guard let imageData = imgae.jpegData(compressionQuality: 0.5) else { return }
        let ref = type.filePath
        
        ref.putData(imageData, metadata: nil) { result, error in
            if let error = error {
                print("DEBUG: Failed to upload images \(error)")
                return
            }
            
            //            ref.downloadURL{ url, _ in
            //                guard let imageUrl = url?.absoluteString else { return }
            //                completion(imageUrl)
            //
            //            }
            
            guard let imageURL = result?.path else {
                return
            }
            
            completion(imageURL)
        }
        print("Successfully uploaded image")
        
    }
}


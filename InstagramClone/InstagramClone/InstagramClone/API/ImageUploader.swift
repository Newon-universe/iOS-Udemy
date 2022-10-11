//
//  ImageUploader.swift
//  InstagramClone
//
//  Created by Kim Yewon on 2022/10/11.
//

import UIKit
import Firebase
import FirebaseStorage

struct ImageUploader {
    static func uploadImage(imgae: UIImage, completion: @escaping(String) -> Void) {
        guard let imageData = imgae.jpegData(compressionQuality: 0.5) else { return }
        
        
        let fileName = NSUUID().uuidString
        
        let ref = Storage.storage().reference(withPath: "/profile_images/\(fileName)")

        
        ref.putData(imageData, metadata: nil) { result, error in
            if let error = error {
                print("DEBUG: Failed to upload images \(error)")
                return
            }
            
            guard let imageURL = result?.path else {
                return
            }
            
            completion(imageURL)
        }
        print("Successfully uploaded image")
        
    }
}


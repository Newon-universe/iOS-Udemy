//
//  ImageDownloader.swift
//  InstagramClone
//
//  Created by Kim Yewon on 2022/10/21.
//

import SwiftUI
import FirebaseStorage

struct ImageDownloader {
    
    static func getProfile(imageUrl: String, completion: @escaping (UIImage?) -> Void) {
        
        Storage.storage().reference().child(imageUrl).getData(maxSize: 5 * 1024 * 1024) { data, error in
            if error == nil && data != nil {
                let image = UIImage(data: data!)
                
                completion(image)
            }
        }
    }
    
    static func getPictureGroup(imageUrl: String) -> UIImage? {
        
        var result: UIImage?
        
        Storage.storage().reference().child(imageUrl).getData(maxSize: 5 * 1024 * 1024) { data, error in
            if error == nil && data != nil {
                result = UIImage(data: data!)
            }
        }
        .resume()
        
        return result
    }
}

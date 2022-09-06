//
//  VideoModel.swift
//  Africa
//
//  Created by Kim Yewon on 2022/09/06.
//

import Foundation

struct Video: Codable, Identifiable {
    let id: String
    let name: String
    let headline: String
    
    var thumbnail: String {
        "video-\(id)"
    }
}

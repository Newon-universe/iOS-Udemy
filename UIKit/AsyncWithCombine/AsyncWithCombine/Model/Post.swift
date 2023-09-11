//
//  Post.swift
//  AsyncWithCombine
//
//  Created by Kim Yewon on 2023/09/11.
//

import Foundation

struct Post: Decodable {
    let userId: Int
    let title: String
    let body: String
}

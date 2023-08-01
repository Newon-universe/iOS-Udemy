//
//  Product.swift
//  CollectionView_Practice
//
//  Created by Kim Yewon on 2023/08/01.
//

import Foundation

struct Product: Hashable {
    let name: String
    let imageURL: String
    let uid: String = UUID().uuidString
}

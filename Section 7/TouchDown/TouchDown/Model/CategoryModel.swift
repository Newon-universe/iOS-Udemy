//
//  CategoryModel.swift
//  TouchDown
//
//  Created by Kim Yewon on 2022/09/11.
//

import SwiftUI

struct Category: Codable, Identifiable, Hashable {
    let id: Int
    let name: String
    let image: String
}

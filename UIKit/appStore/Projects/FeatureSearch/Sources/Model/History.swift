//
//  History.swift
//  FeatureSearch
//
//  Created by Kim Yewon on 2023/09/28.
//  Copyright © 2023 labo.summer. All rights reserved.
//

import Foundation

struct History: Hashable {
    var title: String
    private let uid: String = UUID().uuidString
}

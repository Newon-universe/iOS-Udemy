//
//  SearchResult.swift
//  Core
//
//  Created by Kim Yewon on 2023/09/21.
//  Copyright © 2023 labo.summer. All rights reserved.
//

import Foundation

public struct SearchResult: Hashable {
    public var title: String? = nil
    public var subTitle: String? = nil
    public var logoImage: String? = nil
    private let uid: String = UUID().uuidString
    
    public init(title: String? = nil, subTitle: String? = nil, logoImage: String? = nil) {
        self.title = title
        self.subTitle = subTitle
        self.logoImage = logoImage
    }
}

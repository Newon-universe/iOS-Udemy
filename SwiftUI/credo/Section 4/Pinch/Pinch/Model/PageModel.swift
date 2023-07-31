//
//  PageModel.swift
//  Pinch
//
//  Created by Kim Yewon on 2022/09/02.
//

import Foundation

struct Page: Identifiable {
    let id: Int
    let imageName: String
}

extension Page {
    var thumbnailName: String {
        "thumb-" + imageName
    }
}

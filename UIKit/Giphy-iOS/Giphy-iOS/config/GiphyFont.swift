//
//  GiphyFont.swift
//  Giphy-iOS
//
//  Created by Kim Yewon on 2023/09/13.
//

import UIKit

struct GiphyFont {
    // AvenirNext
    static func regular(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: "NotoSansKR-Regular", size: size) ?? .systemFont(ofSize: size)
    }
    
    static func bold(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: "NotoSansKR-Bold", size: size) ?? .systemFont(ofSize: size)
    }
    
    static func thin(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: "NotoSansKR-Thin", size: size) ?? .systemFont(ofSize: size)
    }
}

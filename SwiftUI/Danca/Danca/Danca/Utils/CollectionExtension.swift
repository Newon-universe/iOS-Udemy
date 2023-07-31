//
//  CollectionExtension.swift
//  Danca
//
//  Created by Kim Yewon on 2022/11/12.
//

import Foundation

extension Collection {
    /// Returns the element at the specified index if it is within bounds, otherwise nil.
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}

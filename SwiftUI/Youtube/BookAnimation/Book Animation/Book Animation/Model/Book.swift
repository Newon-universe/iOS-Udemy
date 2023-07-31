//
//  Book.swift
//  Book Animation
//
//  Created by Kim Yewon on 2022/10/31.
//

import SwiftUI

struct Book: Identifiable, Hashable {
    var id: String = UUID().uuidString
    var title: String
    var imageName: String
    var author: String
}

var sampleBooks: [Book] = [
    .init(title: "Five Feet Apart", imageName: "book1", author: "Rachael Lippincott"),
    .init(title: "The Alchemist", imageName: "book2", author: "William B.Irvine"),
    .init(title: "Booke of Hapiness", imageName: "book3", author: "Anne"),
    .init(title: "Five Feet Apart", imageName: "book4", author: "William Lippincott"),
    .init(title: "Living Alone", imageName: "book5", author: "Jenna Lippincott")
]


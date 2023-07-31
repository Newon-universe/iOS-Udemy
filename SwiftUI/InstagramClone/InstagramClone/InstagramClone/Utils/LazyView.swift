//
//  LazyView.swift
//  InstagramClone
//
//  Created by Kim Yewon on 2022/10/25.
//

import SwiftUI

struct LazyView<Content: View>: View {
    let build: () -> Content
    
    init(_ build: @autoclosure @escaping() -> Content) {
        self.build = build
    }
    
    var body: Content {
        build()
    }
}

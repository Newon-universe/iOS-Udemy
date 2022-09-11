//
//  CenterModifier.swift
//  Africa
//
//  Created by Kim Yewon on 2022/09/11.
//

import SwiftUI

struct CenterModifier: ViewModifier {
    func body(content: Content) -> some View {
        HStack {
            Spacer()
            content
            Spacer()
        }
    }
}

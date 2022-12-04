//
//  ColorExtension.swift
//  Danca
//
//  Created by Kim Yewon on 2022/11/20.
//

import Foundation
import SwiftUI

extension Color {
    init(hex: UInt, alpha: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: alpha
        )
    }
}

extension Color {
    static let background = Color("ColorBackground")
    static let error = Color("ColorError")
    static let accent = Color("ColorAccent")
    static let point = Color("ColorPoint")
}

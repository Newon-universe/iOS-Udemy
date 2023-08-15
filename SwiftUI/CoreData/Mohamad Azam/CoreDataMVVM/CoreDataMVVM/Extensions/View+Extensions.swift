//
//  View+Extensions.swift
//  CoreDataMVVM
//
//  Created by Kim Yewon on 2023/08/14.
//

import Foundation
import SwiftUI

extension View {
    func centerHorizontally() -> some View {
        HStack {
            Spacer()
            self
            Spacer()
        }
    }
}

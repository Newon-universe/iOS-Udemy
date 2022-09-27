//
//  HideKeyboardExtension.swift
//  Devote
//
//  Created by Kim Yewon on 2022/09/13.
//

import SwiftUI

#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif




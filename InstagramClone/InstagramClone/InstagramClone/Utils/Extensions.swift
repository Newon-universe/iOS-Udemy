//
//  Extensions.swift
//  InstagramClone
//
//  Created by Kim Yewon on 2022/10/07.
//

import Foundation
import UIKit

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

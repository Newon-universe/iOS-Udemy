//
//  UIResponder+Extension.swift
//  tip-calculator
//
//  Created by Kim Yewon on 2023/07/28.
//

import UIKit

extension UIResponder {
    var parentViewController: UIViewController? {
        return next as? UIViewController ?? next?.parentViewController
    }
}

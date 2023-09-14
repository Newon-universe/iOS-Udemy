//
//  UIButton+Extension.swift
//  Giphy-iOS
//
//  Created by Kim Yewon on 2023/09/13.
//

import UIKit

extension UIButton {
    func setGradientBackground(colors: [UIColor], startPoint: CGPoint, endPoint: CGPoint) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = colors.map { $0.cgColor }
        gradientLayer.startPoint = startPoint
        gradientLayer.endPoint = endPoint

        if let existingGradientLayer = layer.sublayers?.first(where: { $0 is CAGradientLayer }) {
            layer.replaceSublayer(existingGradientLayer, with: gradientLayer)
        } else {
            layer.insertSublayer(gradientLayer, at: 0)
        }
    }
}

//
//  UIImage+Extension.swift
//  Giphy-iOS
//
//  Created by Kim Yewon on 2023/09/14.
//

import UIKit

extension UIImage {
    
    func drawLinearGradient(colors: [CGColor], startingPoint: CGPoint, endPoint: CGPoint) -> UIImage? {
        let renderer = UIGraphicsImageRenderer(size: self.size)
        
        var shouldReturnNil = false
        let gradientImage = renderer.image { context in
            context.cgContext.translateBy(x: 0, y: self.size.height)
            context.cgContext.scaleBy(x: 1.0, y: -1.0)

            context.cgContext.setBlendMode(.normal)
            let rect = CGRect(x: 0, y: 0, width: self.size.width, height: self.size.height)

            // Create gradient
            let colors = colors as CFArray
            let colorsSpace = CGColorSpaceCreateDeviceRGB()
            
            guard let gradient = CGGradient(colorsSpace: colorsSpace, colors: colors, locations: nil) else {
                shouldReturnNil = true
                return
            }

            // Apply gradient
            guard let cgImage = self.cgImage else {
                shouldReturnNil = true
                print("Couldn't get cgImage of UIImage.")
                return
            }
            
            context.cgContext.clip(to: rect, mask: cgImage)
            context.cgContext.drawLinearGradient(
                gradient,
                start: endPoint,
                end: startingPoint,
                options: .init(rawValue: 0)
            )
        }

        return shouldReturnNil ? nil : gradientImage
    }
    
}

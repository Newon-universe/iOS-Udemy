//
//  RatingViewFactory.swift
//  UI
//
//  Created by Kim Yewon on 2023/09/20.
//  Copyright © 2023 labo.summer. All rights reserved.
//

import UIKit
import SnapKit

public struct RatingViewFactory {
    public static func build(
        rating: Double = 0,
        size: CGFloat = AppStoreSize.captionSize,
        count: String
    ) -> UIStackView {
        let label = UILabelFactory.build(text: " \(count)", font: AppStoreFont.regular(ofSize: AppStoreSize.captionSize), textColor: UIAsset.fontGray.color)
        
        var stackView: UIStackView = {
            let view = UIStackView()
            view.axis = .horizontal
            view.spacing = 1
            view.backgroundColor = .white
            view.tintColor = UIAsset.fontGray.color
            return view
        }()
        
        stackView.configure(rating: rating, size: size, count: count)
        stackView.addArrangedSubview(label)
        
        return stackView
    }
}

extension UIStackView {
    private static let starFillImage: UIImage? = {
        let image = UIImage(systemName: "star.fill")
        return image
    }()
    
    private static let starHalfImage: UIImage? = {
        let image = UIImage(systemName: "star.fill.left")
        return image
    }()

    private static let starEmptyImage: UIImage? = {
        let image = UIImage(systemName: "star")
        return image
    }()
    
    public func configure(
        rating: Double = 0,
        size: CGFloat = AppStoreSize.captionSize,
        count: String
    ) {
        self.arrangedSubviews.forEach {
            self.removeArrangedSubview($0)
        }
        
        for i in 0 ..< 5 {
            let button = UIButton()
            
            if i < Int(rating) {
                button.setImage(UIStackView.starFillImage, for: .normal)
            } else if Double(i) < rating {
                button.setImage(UIStackView.starHalfImage, for: .normal)
            } else {
                button.setImage(UIStackView.starEmptyImage, for: .normal)
            }
            
            button.snp.makeConstraints { make in
                make.width.equalTo(AppStoreSize.captionSize)
                make.height.equalTo(AppStoreSize.captionSize)
            }
            
            self.addArrangedSubview(button)
        }
        
        let label = UILabelFactory.build(text: " \(count)", font: AppStoreFont.regular(ofSize: AppStoreSize.captionSize), textColor: UIAsset.fontGray.color)
        self.addArrangedSubview(label)
    }
}

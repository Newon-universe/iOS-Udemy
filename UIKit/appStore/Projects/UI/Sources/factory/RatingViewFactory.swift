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
        
        let starFillImage: UIImage? = {
            let image = UIImage(systemName: "star.fill")
            return image
        }()
        
        let starHalfImage: UIImage? = {
            let image = UIImage(systemName: "star.fill.left")
            return image
        }()

        let starEmptyImage: UIImage? = {
            let image = UIImage(systemName: "star")
            return image
        }()
        
        let label = UILabelFactory.build(text: " \(count)", font: AppStoreFont.regular(ofSize: AppStoreSize.captionSize), textColor: UIAsset.fontGray.color)
        
        lazy var stackView: UIStackView = {
            let view = UIStackView()
            view.axis = .horizontal
            view.spacing = 1
            view.backgroundColor = .white
            view.tintColor = UIAsset.fontGray.color
            return view
        }()
        
        for i in 0 ..< 5 {
            let button = UIButton()
            
            if i < Int(rating) {
                button.setImage(starFillImage, for: .normal)
            } else if Double(i) < rating {
                button.setImage(starHalfImage, for: .normal)
            } else {
                button.setImage(starEmptyImage, for: .normal)
            }
            
            button.snp.makeConstraints { make in
                make.width.equalTo(AppStoreSize.captionSize)
                make.height.equalTo(AppStoreSize.captionSize)
            }
            
            stackView.addArrangedSubview(button)
        }
        
        stackView.addArrangedSubview(label)
        
        return stackView
    }
}

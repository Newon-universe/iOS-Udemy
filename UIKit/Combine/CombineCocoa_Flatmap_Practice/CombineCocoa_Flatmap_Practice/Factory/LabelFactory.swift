//
//  LabelFactory.swift
//  CombineCocoa_Flatmap_Practice
//
//  Created by Kim Yewon on 2023/08/04.
//

import UIKit

struct LabelFactory {
    static func build(
        text: String?,
        font: UIFont,
        backgroundColor: UIColor = .clear,
        textColor: UIColor = .black,
        textAlignment: NSTextAlignment = .center
    ) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = font
        label.backgroundColor = backgroundColor
        label.textColor = textColor
        label.textAlignment = textAlignment
        return label
    }
}

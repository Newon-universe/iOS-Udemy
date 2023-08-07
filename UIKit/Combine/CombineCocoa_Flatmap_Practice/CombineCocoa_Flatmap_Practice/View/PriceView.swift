//
//  PriceView.swift
//  CombineCocoa_Flatmap_Practice
//
//  Created by Kim Yewon on 2023/08/04.
//

import UIKit
import SnapKit

class PriceView: UIView {
    private lazy var notificationLabel: UILabel = {
        let label = UILabel()
        let text = NSMutableAttributedString(
            string: "Final price",
            attributes: [
                .font: ThemeFont.regular(ofSize: 17),
                .foregroundColor: UIColor.black
            ]
        )
        label.attributedText = text
        
        return label
    }()
    
    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        let text = NSMutableAttributedString(
            string: "$0",
            attributes: [
                .font: ThemeFont.regular(ofSize: 17),
                .foregroundColor: UIColor.black
            ]
        )
        
        label.attributedText = text
        
        return label
    }()
    
    private lazy var VStack: UIStackView = {
        let stackView = UIStackView(
            arrangedSubviews: [notificationLabel, priceLabel]
        )
        
        stackView.axis = .vertical
        stackView.backgroundColor = UIColor.white
        stackView.spacing = 5
        return stackView
    }()
    
    init() {
        super.init(frame: .zero)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layout() {
        layer.cornerRadius = 5
        layer.masksToBounds = true
        
        backgroundColor = .white
        addSubview(VStack)
        
        VStack.snp.makeConstraints { make in
            make.leading.equalTo(snp.leading).offset(12)
            make.trailing.equalTo(snp.trailing).offset(-12)
            make.top.equalTo(snp.top).offset(12)
            make.bottom.equalTo(snp.bottom).offset(-12)
        }
        
        VStack.layer.cornerRadius = 5
        VStack.layer.masksToBounds = true
    }
    
    func configure(price: Double) {
        let text = NSMutableAttributedString(
            string: "$\(price)",
            attributes: [
                .font: ThemeFont.regular(ofSize: 17),
                .foregroundColor: UIColor.black
            ]
        )
        priceLabel.attributedText = text
    }
}

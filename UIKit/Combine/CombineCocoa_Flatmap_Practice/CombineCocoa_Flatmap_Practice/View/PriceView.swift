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
    
    private lazy var spacer: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var VStack: UIStackView = {
        let stackView = UIStackView(
            arrangedSubviews: [notificationLabel, priceLabel, spacer]
        )
        
        stackView.axis = .vertical
        stackView.backgroundColor = UIColor.white
        
        return stackView
    }()
    
    private lazy var container: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [VStack])
        stackView.axis = .vertical
        stackView.backgroundColor = UIColor.white
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
        addSubview(container)
        
        container.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        container.layer.cornerRadius = 5
        container.layer.masksToBounds = true
        
        VStack.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().offset(-24)
        }
        
        spacer.snp.makeConstraints { make in
            make.height.equalTo(10)
        }
    }
}

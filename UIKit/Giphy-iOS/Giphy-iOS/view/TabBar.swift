//
//  TabBar.swift
//  Giphy-iOS
//
//  Created by Kim Yewon on 2023/09/13.
//

import UIKit
import Combine
import SnapKit

final class TabBar: UIView {
    
    private let homeButton: UIButton = {
        var button = UIButton()
        let buttomImage = UIImage(systemName: "house")
        button.setImage(buttomImage, for: .normal)
        
        button.imageView?.snp.makeConstraints { make in
            make.width.equalTo(26)
            make.height.equalTo(24)
        }
        
        return button
    }()
    
    private let searchButton: UIButton = {
        var button = UIButton()
        button.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        
        button.imageView?.snp.makeConstraints { make in
            make.size.equalTo(24)
        }
        
        button.tintColor = .systemOrange
        
        return button
    }()
    
    private let myButton: UIButton = {
        var button = UIButton()
        button.setImage(UIImage(systemName: "person"), for: .normal)
        
        button.imageView?.snp.makeConstraints { make in
            make.size.equalTo(24)
        }
        
        button.tintColor = .systemCyan
        
        return button
    }()
    
    private lazy var hStackView: UIStackView = {
        var stackView = UIStackView(
            arrangedSubviews: [homeButton, searchButton, myButton]
        )
        stackView.axis = .horizontal
        stackView.spacing = 20
        stackView.distribution = .equalSpacing
        
        return stackView
    }()
    
    let gradientLayer = CAGradientLayer()
    
    
    init() {
        super.init(frame: .zero)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layout() {
        gradientLayer.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
        gradientLayer.locations = [0, 1]
        layer.addSublayer(gradientLayer)
        
        addSubview(hStackView)
        
        hStackView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(snp.leading).offset(40)
            make.trailing.equalTo(snp.trailing).offset(-40)
        }
        
        snp.makeConstraints { make in
            make.height.equalTo(72)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
    }
    
    func configure() {
        
    }
}


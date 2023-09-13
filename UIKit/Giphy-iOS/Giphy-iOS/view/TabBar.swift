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
        button.setImage(UIImage(systemName: "house"), for: .normal)
        
        button.imageView?.snp.makeConstraints { make in
            make.width.equalTo(26)
            make.height.equalTo(24)
        }
        
        let startColor = UIColor.blue
        let endColor = UIColor.green
        button.setGradientBackground(colors: [startColor, endColor], startPoint: CGPoint(x: 0, y: 0), endPoint: CGPoint(x: 1, y: 1))
        
        return button
    }()
    
    private let searchButton: UIButton = {
        var button = UIButton()
        button.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        
        button.imageView?.snp.makeConstraints { make in
            make.size.equalTo(24)
        }
        
        let startColor = UIColor.green
        let endColor = UIColor.cyan
        button.setGradientBackground(colors: [startColor, endColor], startPoint: CGPoint(x: 0, y: 0), endPoint: CGPoint(x: 1, y: 1))
        
        return button
    }()
    
    private let myButton: UIButton = {
        var button = UIButton()
        button.setImage(UIImage(systemName: "person"), for: .normal)
        
        button.imageView?.snp.makeConstraints { make in
            make.size.equalTo(24)
        }
        
        let startColor = UIColor.cyan
        let endColor = UIColor.white
        button.setGradientBackground(colors: [startColor, endColor], startPoint: CGPoint(x: 0, y: 0), endPoint: CGPoint(x: 1, y: 1))
        
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
    
    init() {
        super.init(frame: .zero)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layout() {
        backgroundColor = .black
        addSubview(hStackView)
        
        hStackView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(snp.leading).offset(40)
            make.trailing.equalTo(snp.trailing).offset(-40)
        }
        
    }
    
    func configure() {
        
    }
}


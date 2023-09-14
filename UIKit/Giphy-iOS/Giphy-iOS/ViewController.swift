//
//  ViewController.swift
//  Giphy-iOS
//
//  Created by Kim Yewon on 2023/09/13.
//

import UIKit
import Combine
import SnapKit

class ViewController: UIViewController {
    
    private let tabBar = TabBar()
    
    private var gradient: CAGradientLayer = {
        let gradient = CAGradientLayer()
        gradient.colors = [
            UIColor(red: 25/255, green: 25/255, blue: 186/255, alpha: 1).cgColor,
            UIColor(red: 177/255, green: 146/255, blue: 125/255, alpha: 1).cgColor
        ]
        gradient.startPoint = CGPoint(x: 0, y: 0.5)
        gradient.endPoint = CGPoint(x: 1, y: 0.5)
        return gradient
    }()
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        layout()
    }

    func layout() {
        view.backgroundColor = .white
        
        tabBar.translatesAutoresizingMaskIntoConstraints = false
        tabBar.layer.addSublayer(gradient)
        gradient.frame = tabBar.bounds
        
        view.addSubview(tabBar)
        
        tabBar.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
}


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
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        layout()
    }

    func layout() {
        view.backgroundColor = .white
        view.addSubview(tabBar)
        
        tabBar.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.height.equalTo(72)
        }

    }
}


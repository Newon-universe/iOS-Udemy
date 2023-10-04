//
//  appStoreView.swift
//  Application
//
//  Created by Kim Yewon on 2023/09/20.
//  Copyright © 2023 labo.summer. All rights reserved.
//

import UIKit


class AppStoreViewController: UIViewController {
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "HAHA"
        label.textColor = .black
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        navigationItem.titleView = label
    }
}



//
//  ViewController.swift
//  searchSample
//
//  Created by Kim Yewon on 2023/09/20.
//

import UIKit

class ViewController: UIViewController {

    let searchController = UISearchController()
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "HAHA"
        label.textColor = .black
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        navigationItem.searchController = searchController
        navigationItem.titleView = label
    }
}


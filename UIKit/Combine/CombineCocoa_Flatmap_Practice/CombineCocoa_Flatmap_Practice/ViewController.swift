//
//  ViewController.swift
//  CombineCocoa_Flatmap_Practice
//
//  Created by Kim Yewon on 2023/08/04.
//

import UIKit
import CombineCocoa

class ViewController: UIViewController {
    
    private let titleView = TitleView()
    private let priceView = PriceView()
    private let optionView = OptionView()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        layout()
    }

    private func layout() {
        [titleView, priceView, optionView].forEach { view.addSubview($0) }
        view.backgroundColor = .systemGray5
        
        titleView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(15)
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(15)
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-15)
        }
        
        priceView.snp.makeConstraints { make in
            make.top.equalTo(titleView.snp.bottom).offset(15)
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(24)
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-24)
        }
        
        optionView.snp.makeConstraints { make in
            make.top.equalTo(priceView.snp.bottom).offset(15)
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(24)
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-24)
        }
    }
}


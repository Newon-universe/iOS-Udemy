//
//  ScreenShotCell.swift
//  FeatureSearch
//
//  Created by Kim Yewon on 2023/09/20.
//  Copyright © 2023 labo.summer. All rights reserved.
//

import SnapKit
import UIKit
import UI
import Combine
import CombineCocoa


class ScreenShotCell: UICollectionViewCell {
    static let identifier = CellIdentifier.appScreenShotCell.rawValue
    
    private let screenView: UIImageView = {
        let view = UIImageView()
        view.addCornerRadius(radius: 15)
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layout(){
        screenView.backgroundColor = .systemBlue
        addSubview(screenView)
        
        screenView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(AppStoreSize.defaultPadding)
            make.bottom.equalToSuperview().offset(-AppStoreSize.defaultPadding)
            make.leading.trailing.equalToSuperview()
        }
    }
    
    func configure(item: AppScreenShot) {
        screenView.load(url: item.image)
    }
}

//
//  TitleView.swift
//  CombineCocoa_Flatmap_Practice
//
//  Created by Kim Yewon on 2023/08/04.
//

import UIKit
import SnapKit

class TitleView: UIView {
    private let title: UILabel = {
        let label = UILabel()
        let text = NSMutableAttributedString(
            string: "Booking options",
            attributes: [
                .font: ThemeFont.bold(ofSize: 30)
            ]
        )
        
        label.attributedText = text
        return label
    }()
    
    init() {
        super.init(frame: .zero)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layout() {
        addSubview(title)
        title.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

//
//  File.swift
//  CombineCocoa_Flatmap_Practice
//
//  Created by Kim Yewon on 2023/08/04.
//

import UIKit
import SnapKit
import Combine
import CombineCocoa

class OptionItem: UIView {
    
    private lazy var label: UILabel = {
        return LabelFactory.build(
            text: "",
            font: ThemeFont.regular(ofSize: 17),
            textColor: UIColor.black,
            textAlignment: .left
        )
    }()
    
    lazy var segmentedControll: UISegmentedControl = {
        let segmentedControl = UISegmentedControl()
        return segmentedControl
    }()
    
    private lazy var VStack: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [label, segmentedControll])
        stackView.axis = .vertical
        stackView.spacing = 5
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
        addSubview(VStack)
        
        VStack.snp.makeConstraints { make in
            make.top.equalTo(snp.top).offset(10)
            make.bottom.equalTo(snp.bottom).offset(-10)
            make.leading.equalTo(snp.leading).offset(24)
            make.trailing.equalTo(snp.trailing).offset(-24)
        }
    }
    
    func configure(label: String, segment: [String]) {
        let text = NSMutableAttributedString(
            string: label,
            attributes: [.font: ThemeFont.regular(ofSize: 17)]
        )
        
        segmentedControll.removeAllSegments()
        segment.enumerated().forEach { index, item in
            segmentedControll.insertSegment(withTitle: item.capitalized, at: index, animated: false)
        }
        segmentedControll.selectedSegmentIndex = 0
        
        self.label.attributedText = text
    }
}

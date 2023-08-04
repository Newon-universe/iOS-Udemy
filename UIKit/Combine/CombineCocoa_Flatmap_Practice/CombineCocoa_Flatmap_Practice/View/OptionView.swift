//
//  OptionView.swift
//  CombineCocoa_Flatmap_Practice
//
//  Created by Kim Yewon on 2023/08/04.
//

import UIKit
import Combine
import CombineCocoa

class OptionView: UIView {
    private let destinationSegment: OptionItem = OptionItem()
    private lazy var numberOfPassengerSegment: OptionItem = OptionItem()
    private lazy var seatTypeSegment: OptionItem = OptionItem()
    
    private var destinationPublisher: AnyPublisher<Int, Never> {
        return destinationSegment.segmentedControll.selectedSegmentIndexPublisher
    }
    private var numberOfPassengerPublisher: AnyPublisher<Int, Never> {
        return numberOfPassengerSegment.segmentedControll.selectedSegmentIndexPublisher
    }
    private var seatTypeSegmentPublisher: AnyPublisher<Int, Never> {
        return seatTypeSegment.segmentedControll.selectedSegmentIndexPublisher
    }
    
    private var cancellables = Set<AnyCancellable>()
    
    private lazy var button: UIButton = {
       let button = UIButton()
        button.backgroundColor = .systemBlue
        
        let title = NSMutableAttributedString(
            string: "Book",
            attributes: [
                .font: ThemeFont.regular(ofSize: 17),
                .foregroundColor: UIColor.white
            ]
        )
        button.setAttributedTitle(title, for: .normal)
        button.layer.cornerRadius = 5
        button.layer.masksToBounds = true
        
        return button
    }()
    
    init() {
        super.init(frame: .zero)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func observe() {
        destinationPublisher.sink { index in
            print("index \(index)")
        }
        .store(in: &cancellables)
        
        numberOfPassengerPublisher.sink { index in
            print("index \(index)")
        }
        .store(in: &cancellables)
        
        seatTypeSegmentPublisher.sink { index in
            print("index \(index)")
        }
        .store(in: &cancellables)
    }
    
    private func layout() {
        backgroundColor = .white
        layer.cornerRadius = 5
        layer.masksToBounds = true
        
        [destinationSegment, numberOfPassengerSegment, seatTypeSegment, button].forEach { addSubview($0) }
        
        destinationSegment.configure(label: "Destination", segment: Destination.allCases.map { $0.rawValue })
        numberOfPassengerSegment.configure(label: "numberOfPassenger", segment: NumberOfPassenger.allCases.map { $0.rawValue })
        seatTypeSegment.configure(label: "seatTypeSegment", segment: SeatType.allCases.map { $0.rawValue })
        
        destinationSegment.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
        }
        
        numberOfPassengerSegment.snp.makeConstraints { make in
            make.top.equalTo(destinationSegment.snp.bottom).offset(15)
            make.leading.trailing.equalToSuperview()
        }
        
        seatTypeSegment.snp.makeConstraints { make in
            make.top.equalTo(numberOfPassengerSegment.snp.bottom).offset(15)
            make.leading.trailing.equalToSuperview()
            
        }
        
        button.snp.makeConstraints { make in
            make.top.equalTo(seatTypeSegment.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().offset(-24)
            make.bottom.equalToSuperview().offset(-15)
        }
    }
}

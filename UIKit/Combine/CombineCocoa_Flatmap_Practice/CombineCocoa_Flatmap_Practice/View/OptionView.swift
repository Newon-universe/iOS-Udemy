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
    
    @Published var finalPrice: Double = 0
    
    private var destinationPublisher: AnyPublisher<Destination, Never> {
        return destinationSegment.segmentedControll.selectedSegmentIndexPublisher.flatMap {
            if Destination.allCases.indices.contains($0) {
                return Just(Destination.allCases[$0]).eraseToAnyPublisher()
            } else {
                return Empty().eraseToAnyPublisher()
            }
        }.eraseToAnyPublisher()
    }
    private var numberOfPassengerPublisher: AnyPublisher<NumberOfPassenger, Never> {
        return numberOfPassengerSegment.segmentedControll.selectedSegmentIndexPublisher.flatMap {
            if NumberOfPassenger.allCases.indices.contains($0) {
                return Just(NumberOfPassenger.allCases[$0]).eraseToAnyPublisher()
            } else {
                return Empty().eraseToAnyPublisher()
            }
        }.eraseToAnyPublisher()
    }
    
    private var seatTypeSegmentPublisher: AnyPublisher<SeatType, Never> {
        return seatTypeSegment.segmentedControll.selectedSegmentIndexPublisher.flatMap {
            if SeatType.allCases.indices.contains($0) {
                return Just(SeatType.allCases[$0]).eraseToAnyPublisher()
            } else {
                return Empty().eraseToAnyPublisher()
            }
        }.eraseToAnyPublisher()
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
        observe()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func observe() {
        Publishers.CombineLatest3(destinationPublisher, numberOfPassengerPublisher, seatTypeSegmentPublisher).sink { [weak self] (destination, numberOfPassenger, seatType) in
            let price = destination.costPerPassenger * numberOfPassenger.doubleValue * seatType.priceMultiplier
            self?.finalPrice = price
        }.store(in: &cancellables)
        
        button.tapPublisher.sink { _ in
            print("book button tapped")
        }.store(in: &cancellables)
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
            make.height.equalTo(48)
        }
    }
}

//
//  SeatType.swift
//  CombineCocoa_Flatmap_Practice
//
//  Created by Kim Yewon on 2023/08/04.
//

import Foundation

enum SeatType: String, CaseIterable {
    case economy
    case business
    
    var priceMultiplier: Double {
        switch self {
        case .economy: return 1.0
        case .business: return 1.5
        }
    }
}

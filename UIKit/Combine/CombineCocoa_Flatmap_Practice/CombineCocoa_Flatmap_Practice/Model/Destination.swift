//
//  Destination.swift
//  CombineCocoa_Flatmap_Practice
//
//  Created by Kim Yewon on 2023/08/04.
//

import Foundation

enum Destination: String, CaseIterable {
    case singapore
    case taipei
    case seoul
    
    var costPerPassenger: Double {
        switch self {
        case .singapore:
            return 100
        case .taipei:
            return 200
        case .seoul:
            return 300
        }
    }
}

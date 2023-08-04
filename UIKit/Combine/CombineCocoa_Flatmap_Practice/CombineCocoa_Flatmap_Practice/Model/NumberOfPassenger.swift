//
//  NumberOfPassenger.swift
//  CombineCocoa_Flatmap_Practice
//
//  Created by Kim Yewon on 2023/08/04.
//

import Foundation

enum NumberOfPassenger: String, CaseIterable {
    case single
    case double
    
    var doubleValue: Double {
        switch self {
        case .single: return 1.0
        case .double: return 2.0
        }
    }
}

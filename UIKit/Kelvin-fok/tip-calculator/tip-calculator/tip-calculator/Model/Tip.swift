//
//  Tip.swift
//  tip-calculator
//
//  Created by Kim Yewon on 2023/07/28.
//

import Foundation

enum Tip {
    case none
    case tenPercent
    case fiftenPercent
    case twentyPercent
    case custom(value: Int)
    
    var stringValue: String {
        switch self {
        case .none:
            return ""
        case .tenPercent:
            return "10%"
        case .fiftenPercent:
            return "15%"
        case .twentyPercent:
            return "20%"
        case .custom(let value):
            return String(value)
        }
    }
}

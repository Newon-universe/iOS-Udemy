//
//  Report.swift
//  BarGraphDemo
//
//  Created by Kim Yewon on 2022/09/27.
//

import Foundation

struct Report: Hashable {
    
    let year: String
    let revenue: Double
    
}

extension Report {
    
    static func all() -> [Report] {
        
        return [
            Report(year: "2020", revenue: 1500),
            Report(year: "2021", revenue: 3500),
            Report(year: "2022", revenue: 10000)
        ]
        
    }
    
}

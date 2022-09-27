//
//  Order.swift
//  CoffeeOrder
//
//  Created by Kim Yewon on 2022/09/23.
//

import Foundation

struct Order: Codable {
    let name: String
    let coffeeName: String
    let total: Double
    let size: String
    
}

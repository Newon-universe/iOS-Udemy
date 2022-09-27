//
//  Constant.swift
//  TouchDown
//
//  Created by Kim Yewon on 2022/09/11.
//

import SwiftUI

//MARK: - Data

let players: [Player] = Bundle.main.decode("player.json")
let categories: [Category] = Bundle.main.decode("category.json")
let products: [Product] = Bundle.main.decode("product.json")
let brands: [Brand] = Bundle.main.decode("brand.json")
let sampleProduct: Product = products[0]

//MARK: - Color

let colorBackgorund: Color = Color("ColorBackground")
let colorGray: Color = Color(UIColor.systemGray4)

//MARK: - Layout

let columnSpacing: CGFloat = 10
let rowSpacing: CGFloat = 10
var gridLayout: [GridItem] {
    return Array(repeating: GridItem(.flexible(), spacing: rowSpacing), count: 2)
}

//MARK: - UX

let feedback = UIImpactFeedbackGenerator(style: .medium)

//MARK: - API

//MARK: - Image

//MARK: - Font

//MARK: - String

//MARK: - Etc



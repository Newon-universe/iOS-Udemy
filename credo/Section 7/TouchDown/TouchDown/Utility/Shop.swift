//
//  Shop.swift
//  TouchDown
//
//  Created by Kim Yewon on 2022/09/12.
//

import Foundation

class Shop: ObservableObject {
    // ObservableObject & @Published --> make this class @State
    
    @Published var showingProduct: Bool = false
    @Published var selectedProduct: Product? = nil
}

//
//  OrderTotalView.swift
//  CoffeeOrder
//
//  Created by Kim Yewon on 2022/09/23.
//

import SwiftUI

struct OrderTotalView: View {
    
    let total: Double
    
    var body: some View {
        HStack(alignment: .center) {
            Spacer()
            
            Text(String(format: "$%.2f", self.total))
                .font(.title)
                .foregroundColor(.green)
            
            Spacer()
        }
    }
}

struct OrderTotalView_Previews: PreviewProvider {
    static var previews: some View {
        OrderTotalView(total: 45.67)
    }
}

//
//  OrderListView.swift
//  CoffeeOrder
//
//  Created by Kim Yewon on 2022/09/23.
//

import SwiftUI

struct OrderListView: View {
    
    let orders: [OrderViewModel]
    
    init(orders: [OrderViewModel]) {
        self.orders = orders
    }
    
    var body: some View {
        List {
            ForEach(self.orders, id:\.id) { order in
                HStack {
                    Image(order.coffeeName)
                        .resizable()
                        .frame(width: 100, height: 100)
                        .cornerRadius(16)
                    
                    VStack {
                        Text(order.name)
                            .font(.title)
                            .padding([.leading, .bottom], 10)
                        
                        HStack {
                            Text(order.coffeeName)
                                .padding(10)
                                .background(Color.gray)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                            
                            Text(order.size)
                                .padding(10)
                                .background(Color.accentColor)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                    }
                }//: HStaack
            }//: Loop
        }
    }
}

struct OrderListView_Previews: PreviewProvider {
    static var previews: some View {
        OrderListView(
            orders: [
                OrderViewModel(order:Order(name: "Mary", coffeeName: "Regular", total: 3.0, size: "Medium"))
            ]
        )
    }
}

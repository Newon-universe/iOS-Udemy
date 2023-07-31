//
//  OrderListViewModel.swift
//  CoffeeOrder
//
//  Created by Kim Yewon on 2022/09/23.
//

import Foundation

class OrderListViewModel: ObservableObject {
    
    @Published var orders = [OrderViewModel]()
    
    init() {
        fetchOrders()
    }
    
    func fetchOrders() {
        
        WebService().getAllOrders { orders in
            if let orders = orders {
//                self.orders = orders.map { order in
//                    OrderViewModel.init(order: order)
//                }
                self.orders = orders.map(OrderViewModel.init)
            }
        }
        
    }
    
}

class OrderViewModel {
    var id = UUID()
    var order: Order
    
    var name: String {
        return self.order.name
    }
    var size: String {
        return self.order.size
    }
    var coffeeName: String {
        return self.order.coffeeName
    }
    var total: Double {
        return self.order.total
    }
    
    
    init(order: Order) {
        self.order = order
    }
}

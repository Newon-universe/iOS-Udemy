//
//  ContentView.swift
//  CoffeeOrder
//
//  Created by Kim Yewon on 2022/09/23.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var orderListVM = OrderListViewModel()
    @State private var showModal: Bool = false
    
    var body: some View {
        NavigationView {
            OrderListView(orders: self.orderListVM.orders)
                .navigationTitle("Coffee Orders")
                .navigationBarTitleDisplayMode(.large)
                .toolbar(content: {
                    ToolbarItemGroup {
                        
                        HStack {
                            Button {
                                reloadOrders()
                            } label: {
                                Image(systemName: "arrow.clockwise")
                                    .foregroundColor(.accentColor)
                            }

                            
                            Spacer()
                            
                            Button {
                                showAddCoffeeOrderView()
                            } label: {
                                Image(systemName: "plus")
                                    .foregroundColor(.accentColor)
                            }
                            
                            
                        }
                        
                    }
                })
                .sheet(isPresented: $showModal) {
                    AddCoffeeOrderView(isPresented: self.$showModal)
                }
        }//: Navigation
        
    }
    
    private func reloadOrders() {
        self.orderListVM.fetchOrders()
    }
    
    private func showAddCoffeeOrderView() {
        self.showModal = true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

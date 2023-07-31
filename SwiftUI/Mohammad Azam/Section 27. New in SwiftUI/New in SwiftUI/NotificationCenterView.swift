//
//  NotificationCenterView.swift
//  New in SwiftUI
//
//  Created by Kim Yewon on 2022/09/29.
//

import SwiftUI

struct NotificationCenterView: View {
    
    @State private var stockName: String = "ENE"
    @State private var stockPrice: Double?
    
    private func updateStockPrice() {
        stockPrice = Double.random(in: 0...1.0)
    }
    
    var body: some View {
        VStack {
            
            Text(stockName)
                .font(.largeTitle)
                .padding()
            
            Text(stockPrice != nil ? "$\(String(format: "%.2f", stockPrice!))" : "")
            
        }
        .onAppear {
            updateStockPrice()
        }
        .onReceive(NotificationCenter.default.publisher(for: UIApplication.willEnterForegroundNotification)) { _ in
            updateStockPrice()
        }
    }
    
}

struct NotificationCenterView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationCenterView()
    }
}

//
//  ContentView.swift
//  Preview Practice
//
//  Created by Kim Yewon on 2022/09/26.
//

import SwiftUI

struct ContentView: View {
    
    let dishes = Dish.all()
    
    var body: some View {
        
        List {
            ForEach(dishes, id: \.self) { dish in
                DishCell(dish: dish)
            }
        } //: List
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

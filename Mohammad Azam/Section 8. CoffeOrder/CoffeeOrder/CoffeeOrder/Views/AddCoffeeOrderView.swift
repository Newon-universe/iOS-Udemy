//
//  AddCoffeeOrderView.swift
//  CoffeeOrder
//
//  Created by Kim Yewon on 2022/09/23.
//

import SwiftUI

struct AddCoffeeOrderView: View {
    
    //MARK: - Property
    @ObservedObject private var addCoffeeOrderVM = AddCoffeeOrderViewModel()
    @Binding var isPresented: Bool
    
    //MARK: - Body
    var body: some View {
        NavigationView {
            
            VStack {
                Form {
                    Section {
                        TextField("Enter name", text: self.$addCoffeeOrderVM.name)
                    } header: {
                        Text("INFORMATION")
                            .font(.body)
                    }
                    
                    Section {
                        ForEach(addCoffeeOrderVM.coffeeList, id: \.name) { coffee in
                            CoffeeCellView(coffee: coffee, selection: self.$addCoffeeOrderVM.coffeeName)
                        }
                    } header: {
                        Text("SELECT COFFEE")
                            .font(.body)
                    }
                    
                    Section {
                        Picker("", selection: self.$addCoffeeOrderVM.size) {
                            Text("Small")
                                .tag("Small")
                            Text("Medium")
                                .tag("Medium")
                            Text("Large")
                                .tag("Large")
                        }
                        .pickerStyle(SegmentedPickerStyle())
                    } header: {
                        Text("SELECT COFFEE")
                            .font(.body)
                    } footer: {
                        OrderTotalView(total: self.addCoffeeOrderVM.total)
                    }
                    
                    HStack {
                        Button {
                            self.addCoffeeOrderVM.placeOrder()
                            self.isPresented = false
                        } label: {
                            Text("Place Order")
                        }
                        .padding(.vertical, 12)
                        .padding(.horizontal, 100)
                        .foregroundColor(.white)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                    }
                    
                }//: Form
                
                
                
                
            }
            .navigationTitle("Add Order")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

struct CoffeeCellView: View {
    
    let coffee: CoffeeViewModel
    @Binding var selection: String
    
    var body: some View {
        HStack() {
            Image(coffee.imageURL)
                .resizable()
                .frame(width: 100 ,height: 100)
                .cornerRadius(6)
            Text(coffee.name)
                .font(.title2)
                .padding()
            
            Spacer()
            
            Image(systemName: self.selection == self.coffee.name ? "checkmark" : "")
                .padding()
        }
        .onTapGesture {
            print(self.selection)
            print(self.coffee.name)
            self.selection = self.coffee.name
        }
    }
}
//
//struct AddCoffeeOrderView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddCoffeeOrderView(isPresented: true)
//    }
//}

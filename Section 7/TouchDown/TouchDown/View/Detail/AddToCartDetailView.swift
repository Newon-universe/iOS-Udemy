//
//  AddToCartDetailView.swift
//  TouchDown
//
//  Created by Kim Yewon on 2022/09/12.
//

import SwiftUI

struct AddToCartDetailView: View {
    //MARK: - Property
    
    @EnvironmentObject var shop: Shop
    
    //MARK: - Body
    var body: some View {
        Button {
            
        } label: {
            Button {
                feedback.impactOccurred()
            } label: {
                Spacer()
                
                Text("Add to cart".uppercased())
                    .font(.system(.title2, design: .rounded))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                Spacer()
            }
            .padding(15)
            .background(
                Color(
                    red: shop.selectedProduct?.red ?? sampleProduct.red,
                    green: shop.selectedProduct?.green ?? sampleProduct.green,
                    blue: shop.selectedProduct?.blue ?? sampleProduct.blue
                )
            )
        }//: Button
        .clipShape(Capsule())

    }
}

//MARK: - Preview
struct AddToCartDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AddToCartDetailView()
            .environmentObject(Shop())
            .previewLayout(.sizeThatFits)
            .padding()
    }
}

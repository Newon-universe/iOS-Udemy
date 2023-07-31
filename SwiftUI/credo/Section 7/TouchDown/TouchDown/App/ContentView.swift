//
//  ContentView.swift
//  TouchDown
//
//  Created by Kim Yewon on 2022/09/11.
//

import SwiftUI

struct ContentView: View {
    //MARK: - Properties
    
    @EnvironmentObject var shop: Shop
    
    // UIWindowScene.windows.first?.safeAreaInsets.top is deprecated, so you can use this.

    let keyWindow = UIApplication.shared.connectedScenes
        .filter({$0.activationState == .foregroundActive})
        .compactMap({$0 as? UIWindowScene})
        .first?.windows
        .filter({$0.isKeyWindow}).first
    
    
    //MARK: - BODY
    
    var body: some View {
        
        
        if shop.showingProduct == false && shop.selectedProduct == nil {
            VStack(spacing: 0) {
                
                NavigationBarView()
                    .padding(.horizontal, 15)
                    .padding(.bottom)
                //                .padding(.top, keyWindow?.safeAreaInsets.top)
                    .background(.white)
                    .shadow(color: .black.opacity(0.05), radius: 5, x: 0, y: 5)
                
                ScrollView(.vertical, showsIndicators: true) {
                    VStack {
                        
                        FeaturedTabView()
                            .padding(.vertical)
                            .frame(height: UIScreen.main.bounds.width / 1.475)
                        
                        CategoryGridView()
                        
                        TitleView(title: "Helmets")
                        
                        LazyVGrid(columns: gridLayout, spacing: 15) {
                            ForEach(products) { product in
                                ProductItemView(product: product)
                                    .onTapGesture {
                                        feedback.impactOccurred()
                                        withAnimation(.easeOut) {
                                            shop.selectedProduct = product
                                            shop.showingProduct = true
                                        }
                                    }
                            } //: Loop
                        } //: Grid
                        .padding(15)
                        
                        TitleView(title: "Brands")
                        
                        BrandGridView()
                        
                        FooterView()
                            .padding(.horizontal)
                    }//: VStack
                }//: Scroll
                
                Spacer()
                
            } //: VStack
            .background(colorBackgorund.ignoresSafeArea(.all, edges: .all))
            
        } else {
            ProductDetailView()
        }
        
        
    }
}


//MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(Shop())
    }
}

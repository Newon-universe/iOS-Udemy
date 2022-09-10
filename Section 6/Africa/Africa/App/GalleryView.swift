//
//  GalleryView.swift
//  Africa
//
//  Created by Kim Yewon on 2022/09/05.
//

import SwiftUI

struct GalleryView: View {
    //MARK: - PROPERTIES
    
    @State private var selectedAnimal: String = "lion"
    @State private var isAnimating: Bool = false
    
    let animals: [Animal] = Bundle.main.decode("animals.json")
    let haptics = UIImpactFeedbackGenerator(style: .medium)
    
    // Simple Grid Definition
    //    let gridLayout: [GridItem] = [
    //        GridItem(.flexible()),
    //        GridItem(.flexible()),
    //        GridItem(.flexible())
    //    ]
    
    
    // Efficient Grid Definition
//    let gridLayout: [GridItem] = Array(repeating: GridItem(.flexible()), count: 3)
    
    // Dynamic grid layout
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var gridColumn: Double = 3.0
    
    func gridSwitch() {
        isAnimating.toggle()
        gridLayout = Array(repeating: .init(.flexible()), count: Int(gridColumn))
    }
    
    //MARK: - BODY
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            //MARK: - Grid
            VStack(alignment: .center, spacing: 30) {
                //MARK: - Image
                
                Image(selectedAnimal)
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .overlay(Circle().stroke(.white, lineWidth: 8))
                
                //MARK: - Slider
                
                Slider(value: $gridColumn, in: 2...4, step: 1)
                    .padding(.horizontal)
                    .onChange(of: gridColumn) { newValue in
                        gridSwitch()
                    }
                
                //MARK: - Grid
                
                LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                    ForEach(animals) { item in
                        Image(item.image)
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .overlay(Circle().stroke(.white, lineWidth: 1))
                            .onTapGesture {
                                selectedAnimal = item.image
                                haptics.impactOccurred()
                            }
                    }//: Loop
                }//: Grid
                .animation(.easeIn, value: isAnimating)
                .onAppear {
                    gridSwitch()
                }
            }//: VStack
            .padding(.horizontal, 10)
            .padding(.vertical, 50)
            
            
        } //: Scroll
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(MotionAnimationView())
    }
}

//MARK: - PREVIEW

struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}

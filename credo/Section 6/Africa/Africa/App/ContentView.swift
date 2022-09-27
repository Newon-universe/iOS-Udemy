//
//  ContentView.swift
//  Africa
//
//  Created by Kim Yewon on 2022/09/05.
//

import SwiftUI

struct ContentView: View {
    //MARK: - PROPERTIES
    
    let animals: [Animal] = Bundle.main.decode("animals.json")
    let haptics = UIImpactFeedbackGenerator(style: .medium)
    
    @State private var isGridViewActive: Bool = false
    @State private var isAnimating: Bool = false
    
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var gridColumn: Int = 1
    @State private var toolbarIcon: String = "square.grid.2x2"
    
    //MARK: - Function
    func gridSwitch() {
        gridLayout = Array(repeating: .init(.flexible()), count: gridLayout.count % 3 + 1)
        gridColumn = gridLayout.count
        print("Grid number: \(gridColumn)")
        
        //toolbar Image
        switch gridColumn {
        case 2: toolbarIcon = "square.grid.2x2"
        case 3: toolbarIcon = "square.grid.3x2"
        case 1: toolbarIcon = "rectangle.grid.1x2"
        default: toolbarIcon = "square.grid.2x2"
        }
    }
    
    //MARK: - BODY
    
    var body: some View {
        NavigationView {
            Group {
                if isGridViewActive {
                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                            ForEach(animals) { animal in
                                NavigationLink(destination: AnimalDetailView(animal: animal)) {
                                    AnimalGridItemView(animal: animal)
                                } //: Link
                            }//: Loop
                        }//: Grid
                        .padding(10)
                        .animation(.easeIn, value: isAnimating)
                    }//: Scroll
                } else {
                    List {
                        CoverImageView()
                            .frame(height: 300)
                            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        
                        ForEach(animals) { animal in
                            NavigationLink(destination: AnimalDetailView(animal: animal)) {
                                AnimalListItemView(animal: animal)
                            }//: Link
                        }//: Loop
                        
                        CreditsView()
                            .modifier(CenterModifier())
                    }//: List
                }//: Condition
            }//: Group
            .navigationTitle("Africa")
            .navigationBarTitleDisplayMode(.large)
            .buttonStyle(PlainButtonStyle())
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack(spacing: 16) {
                        // List
                        Button {
                            isAnimating.toggle()
                            isGridViewActive = false
                            haptics.impactOccurred()
                        } label: {
                            Image(systemName: "square.fill.text.grid.1x2")
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .primary : .accentColor)
                        }
                        
                        // Grid
                        Button {
                            isAnimating.toggle()
                            isGridViewActive = true
                            haptics.impactOccurred()
                            gridSwitch()
                        } label: {
                            Image(systemName: toolbarIcon)
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .accentColor : .primary)
                        }
                        
                        
                    } //: HStack
                }
            }//: ToolBar
        }//: NAVIGATION
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

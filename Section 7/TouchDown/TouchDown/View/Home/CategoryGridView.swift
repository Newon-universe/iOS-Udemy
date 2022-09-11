//
//  CategoryGridView.swift
//  TouchDown
//
//  Created by Kim Yewon on 2022/09/11.
//

import SwiftUI

struct CategoryGridView: View {
    //MARK: - PROPERTIES
    
    //MARK: - BODY
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: gridLayout, alignment: .center, spacing: columnSpacing, pinnedViews: []) {
                
                Section(
                    header: SectionView(rotateClockwise: false),
                    footer: SectionView(rotateClockwise: true)
                ) {
                    ForEach(Array(categories.enumerated()), id: \.1) { index, category in
                        if index == 0 {
                            CategoryItemView(category: category, oddPrevious: category)
                        } else if index % 2 == 1 {
                            CategoryItemView(category: category, oddPrevious: categories[index - 1])
                        } else {
                            CategoryItemView(category: category, oddPrevious: category)
                        }
                    }//: Loop
                }
            }//: Grid
            .frame(height: 140)
            .padding(.horizontal, 15)
            .padding(.vertical, 10)
        }//: Scrool
    }
}

//MARK: - PREVIEW
struct CategoryGridView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryGridView()
            .previewLayout(.sizeThatFits)
            .padding()
            .background(colorBackgorund)
    }
}

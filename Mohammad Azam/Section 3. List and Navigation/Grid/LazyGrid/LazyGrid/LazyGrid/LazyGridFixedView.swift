//
//  LazyGridUnderstandView.swift
//  LazyGrid
//
//  Created by Kim Yewon on 2022/09/21.
//

import SwiftUI

struct LazyGridFixedView: View {
    
    let columns: [GridItem] = [
        GridItem(.fixed(100)),
        GridItem(.fixed(200)),
        GridItem(.fixed(100))
    ]
    
    var body: some View {
        ScrollView {
        
            LazyVGrid(columns: columns) {
                ForEach(1..<50) { _ in
                    Rectangle()
                        .fill(Color.accentColor)
                        .aspectRatio(contentMode: .fit)
                }
            }
        }
    }
}

struct LazyGridUnderstandView_Previews: PreviewProvider {
    static var previews: some View {
        LazyGridFixedView()
    }
}

//
//  LazyGridFlexView.swift
//  LazyGrid
//
//  Created by Kim Yewon on 2022/09/21.
//

import SwiftUI

struct LazyGridFlexView: View {
    
    //MARK: - Property
    
    let columns: [GridItem] = [
        GridItem(.fixed(100)),
        GridItem(.fixed(100)),
        GridItem(.fixed(100))
    ]
    
    //MARK: - func
    
    private func headerView(_ index: Int) -> some View {
        Text("Section \(index)")
            .padding()
            .foregroundColor(Color.white)
            .font(.title)
            .frame(maxWidth: .infinity)
            .background(Color.blue)
    }
    
    
    //MARK: - Body
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 10, pinnedViews: [.sectionHeaders]) {
                    ForEach(1 ..< 11) { index in
                        Section(header: headerView(index)) {
                            ForEach(1 ..< 20) { _ in
                                Rectangle()
                                    .fill(Color.red)
                                    .aspectRatio(contentMode: .fit)
                            } //: Loop
                        } //: Section
                    } //: Loop
                }//: LazyVGrid
                .padding()
            }//: ScrollView
            .navigationTitle("Pinned views")
            .navigationBarTitleDisplayMode(.large)
        } //: NavigationView
       
    }
}

struct LazyGridFlexView_Previews: PreviewProvider {
    static var previews: some View {
        LazyGridFlexView()
    }
}

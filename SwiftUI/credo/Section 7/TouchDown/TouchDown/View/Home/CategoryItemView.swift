//
//  CategoryItemView.swift
//  TouchDown
//
//  Created by Kim Yewon on 2022/09/11.
//

import SwiftUI

struct CategoryItemView: View {
    //MARK: - PROPERTIES
    
    let category: Category
    let oddPrevious: Category
    var categoryWidth: CGFloat {
        if category == oddPrevious {
            return CGFloat(120 + category.name.count * 7)
        } else {
            return CGFloat(120 + oddPrevious.name.count * 7)
        }
    }
    
    //MARK: - BODY
    var body: some View {
        Button {
            
        } label: {
            HStack(alignment: .center, spacing: 6) {
                Image(category.image)
                    .renderingMode(.template)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30, alignment: .center)
                    .foregroundColor(.gray)
                
                Text(category.name.uppercased())
                    .fontWeight(.light)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.leading)
                
                Spacer()
            }//: HStack
            .frame(width: categoryWidth, height: 30, alignment: .leading)
            .padding()
            .background(Color.white.cornerRadius(12))
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(.gray, lineWidth: 1)
            )
            
        }//: Butotn
    }
}

//MARK: - PREVIEW
struct CategoryItemView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryItemView(category: categories[0], oddPrevious: categories[0])
            .previewLayout(.sizeThatFits)
            .padding()
            .background(colorBackgorund)
    }
}

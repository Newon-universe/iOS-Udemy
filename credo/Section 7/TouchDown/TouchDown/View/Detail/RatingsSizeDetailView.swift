//
//  RatingsSizeDetailView.swift
//  TouchDown
//
//  Created by Kim Yewon on 2022/09/12.
//

import SwiftUI

struct RatingsSizeDetailView: View {
    //MARK: - Property
    
    let sizes: [String] = ["XS", "S", "M", "L", "XL"]
    
    //MARK: - Body
    var body: some View {
        HStack(alignment: .top, spacing: 3) {
            // Ratings
            VStack(alignment: .leading, spacing: 3) {
                Text("Ratings")
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .foregroundColor(colorGray)
                
                HStack(alignment: .center, spacing: 3) {
                    ForEach(0..<5, id: \.self) { item in
                        Image(systemName: "star.fill")
                            .frame(width: 28, height: 28, alignment: .center)
                            .background(colorGray.cornerRadius(5))
                            .foregroundColor(.white)
                    }
                }
            }
                        
            Spacer()
            
            // Sizes
            VStack(alignment: .trailing, spacing: 3) {
                Text("Sizes")
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .foregroundColor(colorGray)
                
                HStack(alignment: .center, spacing: 5) {
                    ForEach(sizes, id: \.self) { size in
                        Text(size)
                            .font(.footnote)
                            .fontWeight(.heavy)
                            .foregroundColor(colorGray)
                            .frame(width: 28, height: 28)
                            .background(Color.white.cornerRadius(5))
                            .background(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(colorGray, lineWidth: 2)
                            )
                    }
                }
            }
        }//: HStack
    }
}

//MARK: - Preview
struct RatingsSizeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RatingsSizeDetailView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}

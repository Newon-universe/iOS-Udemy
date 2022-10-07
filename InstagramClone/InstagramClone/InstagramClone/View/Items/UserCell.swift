//
//  UserCell.swift
//  InstagramClone
//
//  Created by Kim Yewon on 2022/10/07.
//

import SwiftUI

struct UserCell: View {
    var body: some View {
        HStack {
            
            // image
            Image("astronut")
                .resizable()
                .scaledToFill()
                .frame(width: 48, height: 48)
                .clipShape(Circle())
//                .cornerRadius(48 / 2)
            
            
            // VStack -> user name, full name
            VStack(alignment: .leading) {
                Text("Astronut")
                    .font(.system(size: 14, weight: .semibold))
                
                Text("Kim Newon")
                    .font(.system(size: 14))
            }
            
            Spacer()
        }
    }
}

struct UserCell_Previews: PreviewProvider {
    static var previews: some View {
        UserCell()
            .previewLayout(.sizeThatFits)
    }
}

//
//  NotificationCell.swift
//  InstagramClone
//
//  Created by Kim Yewon on 2022/10/07.
//

import SwiftUI

struct NotificationCell: View {
    
    //MARK: - Properties
    @State private var showPostImage = false
    
    //MARK: - Function
    
    //MARK: - Body
    
    var body: some View {
        HStack {
            // image
            Image("astronut")
                .resizable()
                .scaledToFill()
                .frame(width: 40, height: 40)
                .clipShape(Circle())
//                .cornerRadius(48 / 2)
            
            
            // VStack -> user name, full name
            
            Text("shone")
                .font(.system(size: 14, weight: .semibold))
            + Text(" liked one of your posts.")
                .font(.system(size: 15))
            
            Spacer()
            
            if showPostImage {
                Image("shone")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .scaledToFill()
                
            } else {
                Button {
                    
                } label: {
                    Text("Follow")
                        .padding(.horizontal, 20)
                        .padding(.vertical, 8)
                        .foregroundColor(.white)
                        .background(.blue)
                        .clipShape(Capsule())
                        .font(.system(size: 14, weight: .semibold))
                }

            }
            
        } //: HStack
        .padding()
    }
}

struct NotificationCell_Previews: PreviewProvider {
    static var previews: some View {
        NotificationCell()
            .previewLayout(.sizeThatFits)
    }
}

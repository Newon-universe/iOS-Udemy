//
//  UserCell.swift
//  InstagramClone
//
//  Created by Kim Yewon on 2022/10/07.
//

import SwiftUI
import Firebase
import FirebaseStorage

struct UserCell: View {
    //MARK: - Properties
    let user: User
    @State private var profile: UIImage?

    //MARK: - Body

    var body: some View {
        
        HStack {
            // image
            Image(uiImage: profile ?? UIImage(systemName: "x.circle.fill")!)
                .resizable()
                .scaledToFill()
                .frame(width: 48, height: 48)
                .clipShape(Circle())
//                .cornerRadius(48 / 2)
                .onAppear {
                    ImageDownloader.getProfile(imageUrl: user.profileImageUrl) { image in
                        profile = image
                    }
                }
            
            // VStack -> user name, full name
            VStack(alignment: .leading) {
                Text(user.userName)
                    .font(.system(size: 14, weight: .semibold))
                
                Text(user.fullName)
                    .font(.system(size: 14))
            }
            
            Spacer()
        }
    }
}

//
//struct UserCell_Previews: PreviewProvider {
//    static var previews: some View {
//        UserCell()
//            .previewLayout(.sizeThatFits)
//    }
//}

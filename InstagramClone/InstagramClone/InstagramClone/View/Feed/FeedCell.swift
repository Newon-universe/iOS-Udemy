//
//  FeedCell.swift
//  InstagramClone
//
//  Created by Kim Yewon on 2022/10/07.
//

import SwiftUI

struct FeedCell: View {
    
    //MARK: - Properties
    @State var post: Post
    @State private var posterProfile: UIImage?
    @State private var posterImage: UIImage?
    //MARK: - Body
    
    var body: some View {
        VStack(alignment: .leading) {
            // user info
            HStack {
                Image(uiImage: posterProfile ?? UIImage(systemName: "x.circle.fill")!)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 36, height: 36)
                    .clipped()
                    .cornerRadius(18)
                    .onAppear {
                        ImageDownloader.getProfile(imageUrl: post.ownerImageUrl) { image in
                            posterProfile = image
                        }
                    }
                
                Text(post.ownerUsername)
                    .font(.system(size: 14, weight: .semibold))
            } //: HStack
            .padding([.leading, .bottom], 8)
            
            
            // post image
            Image(uiImage: posterImage ?? UIImage(systemName: "x.circle.fill")!)
                .resizable()
                .scaledToFit()
                .frame(maxHeight: 440)
                .onAppear {
                    ImageDownloader.getProfile(imageUrl: post.imageUrl) { image in
                        posterImage = image
                    }
                }
            
            // action buttons
            HStack(spacing: 16) {
                Button {
                    
                } label: {
                    Image(systemName: "heart")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 20, height: 20)
                        .font(.system(size: 20))
                        .padding(4)
                }
                
                Button {
                    
                } label: {
                    Image(systemName: "bubble.right")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 20, height: 20)
                        .font(.system(size: 20))
                        .padding(4)
                }
                
                Button {
                    
                } label: {
                    Image(systemName: "paperplane")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 20, height: 20)
                        .font(.system(size: 20))
                        .padding(4)
                }
            }//: HStack
            .padding(.leading, 4)
            .foregroundColor(.black)
            
            // caption
            
            Text("\(post.likes) likes")
                .font(.system(size: 14, weight: .semibold))
                .padding(.leading, 8)
                .padding(.bottom, 2)
            
            HStack {
                Text(post.ownerUsername)
                    .font(.system(size: 14, weight: .semibold))
                + Text(" ")
                + Text(post.caption)
                    .font(.system(size: 15))
            }
            .padding(.horizontal, 8)
            
            Text(String(format: "\(post.timestamp)", "dd") + "d")
                .font(.system(size: 14))
                .foregroundColor(.gray)
                .padding(.leading, 8)
                .padding(.top, -2)
        }//: VStack
    }
}

//struct FeedCell_Previews: PreviewProvider {
//    static var previews: some View {
//        FeedCell()
//    }
//}

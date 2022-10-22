//
//  FeedCell.swift
//  InstagramClone
//
//  Created by Kim Yewon on 2022/10/07.
//

import SwiftUI

struct FeedCell: View {
    
    //MARK: - Properties

    @ObservedObject var viewModel: FeedCellViewModel
    var didLike: Bool { return viewModel.post.didLike ?? false }
    
    init(viewModel: FeedCellViewModel) {
        self.viewModel = viewModel
        Task.init {
            await viewModel.userPic = ImageDownloader.getPictureGroup(imageUrl: viewModel.post.ownerImageUrl) ?? UIImage(systemName: "x.circle.fill")!
            await viewModel.postPic = ImageDownloader.getPictureGroup(imageUrl: viewModel.post.imageUrl) ?? UIImage(systemName: "x.circle.fill")!
        }
    }
    
    //MARK: - Body
    
    var body: some View {
        VStack(alignment: .leading) {
            // user info
            HStack {
                Image(uiImage: viewModel.userPic)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 36, height: 36)
                    .clipped()
                    .cornerRadius(18)
                    
                
                Text(viewModel.post.ownerUsername)
                    .font(.system(size: 14, weight: .semibold))
            } //: HStack
            .padding([.leading, .bottom], 8)
            
            
            // post image
            Image(uiImage: viewModel.postPic)
                .resizable()
                .scaledToFit()
                .frame(maxHeight: 440)
            
            // action buttons
            HStack(spacing: 16) {
                Button {
                    didLike ? viewModel.unlike() : viewModel.like()
                } label: {
                    Image(systemName: didLike ? "heart.fill" : "heart")
                        .resizable()
                        .scaledToFill()
                        .foregroundColor(didLike ? .red : .black)
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
            
            Text("\(viewModel.likeString)")
                .font(.system(size: 14, weight: .semibold))
                .padding(.leading, 8)
                .padding(.bottom, 2)
            
            HStack {
                Text(viewModel.post.ownerUsername)
                    .font(.system(size: 14, weight: .semibold))
                + Text(" ")
                + Text(viewModel.post.caption)
                    .font(.system(size: 15))
            }
            .padding(.horizontal, 8)
            
            Text("\(viewModel.postDate) d")
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

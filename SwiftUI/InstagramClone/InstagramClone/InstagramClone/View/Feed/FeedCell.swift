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
            if viewModel.userPic == nil {
                await viewModel.userPic = ImageDownloader.getAsyncPicture(imageUrl: viewModel.post.ownerImageUrl) ?? UIImage(systemName: "x.circle.fill")!
            }
            if viewModel.postPic == nil {
                await viewModel.postPic = ImageDownloader.getAsyncPicture(imageUrl: viewModel.post.imageUrl) ?? UIImage(systemName: "x.circle.fill")!
            }
        }
    }
    
    //MARK: - Body
    var body: some View {
        VStack(alignment: .leading) {
            // user info
            NavigationLink {
                if let user = viewModel.user {
                    ProfileView(user: user)
                }
            } label: {
                HStack {
                    Image(uiImage: viewModel.userPic ?? UIImage(systemName: "x.circle.fill")!)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 36, height: 36)
                        .clipped()
                        .cornerRadius(18)
                    
                    Text(viewModel.post.ownerUsername)
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(.black)
                } //: HStack
                .padding([.leading, .bottom], 8)
            }

            
            
            // post image
            HStack(alignment: .center) {
                
                Spacer()
                
                Image(uiImage: viewModel.postPic ?? UIImage(systemName: "x.circle.fill")!)
                    .resizable()
                    .scaledToFit()
                    .frame(maxHeight: 440)
                    .transition(AnyTransition.opacity.animation(.easeInOut))
                    .animation(.easeInOut, value: viewModel.postPic)
                    .id(viewModel.postPic)
                
                Spacer()
                
            }
            
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
                
                NavigationLink {
                    LazyView(CommentView(post: viewModel.post))
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
            
            Text("\(viewModel.timestampString)")
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

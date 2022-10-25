//
//  NotificationCell.swift
//  InstagramClone
//
//  Created by Kim Yewon on 2022/10/07.
//

import SwiftUI

struct NotificationCell: View {
    
    //MARK: - Properties
    @ObservedObject var viewModel: NotificationCellViewModel
    @State private var showPostImage = false
    @State private var profile: UIImage?
    @State private var postImage: UIImage?
    var isFollowed: Bool { return viewModel.notification.isFollowed ?? false }
    
    //MARK: - Function
    init(viewModel: NotificationCellViewModel) {
        self.viewModel = viewModel
    }
    
    //MARK: - Body
    
    var body: some View {
        
        HStack {
            // image
            NavigationLink {
                if let user = viewModel.notification.user {
                    LazyView(ProfileView(user: user))
                }
            } label: {
                Image(uiImage: profile ?? UIImage(systemName: "x.circle.fill")!)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                    .onAppear {
                        ImageDownloader.getProfile(imageUrl: viewModel.notification.profileImageUrl) { image in
                            self.profile = image
                        }
                    }
                //                .cornerRadius(48 / 2)
                
                // VStack -> user name, full name
                
                Text(viewModel.notification.username)
                    .font(.system(size: 14, weight: .semibold))
                + Text(viewModel.notification.type.notificationMessage)
                    .font(.system(size: 15))
                + Text(" \(viewModel.timestampString)")
                    .foregroundColor(.gray)
                    .font(.system(size: 12))
            }
            
            Spacer()
            
            if viewModel.notification.type != .follow {
                if let post = viewModel.notification.post {
                    NavigationLink {
                        LazyView(FeedCell(viewModel: FeedCellViewModel(post: post)))
                    } label: {
                        Image(uiImage: postImage ?? UIImage(systemName: "x.circle.fill")!)
                            .resizable()
                            .frame(width: 40, height: 40)
                            .scaledToFill()
                            .clipped()
                            .onAppear {
                                ImageDownloader.getProfile(imageUrl: viewModel.notification.post?.imageUrl ?? "") { image in
                                    self.postImage = image
                                }
                            }
                    }
                }
                
            } else {
                Button {
                    isFollowed ? viewModel.unfolllow() : viewModel.follow()
                } label: {
                    Text(isFollowed ? "Following" : "Follow")
                        .padding()
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(isFollowed ? .black : .white)
                        .frame(width: 100, height: 32)
                        .overlay {
                            RoundedRectangle(cornerRadius: 3)
                                .stroke(.gray, lineWidth: isFollowed ? 1 : 0)
                        }
                }
                .background(isFollowed ? .white : .blue)
                .cornerRadius(3)
                
            }
            
        } //: HStack
        .padding()
    }
}

//struct NotificationCell_Previews: PreviewProvider {
//    static var previews: some View {
//        NotificationCell()
//            .previewLayout(.sizeThatFits)
//    }
//}

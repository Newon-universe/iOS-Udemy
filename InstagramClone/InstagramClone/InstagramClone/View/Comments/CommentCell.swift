//
//  CommentCell.swift
//  InstagramClone
//
//  Created by Kim Yewon on 2022/10/23.
//

import SwiftUI

@MainActor
struct CommentCell: View {
    
    //MARK: - Properties
    @ObservedObject var viewModel: CommentViewModel
    let index: Int
    
    //MARK: - Body
    
    var body: some View {
        HStack {
            Image(uiImage: viewModel.commentsUserProfile[index])
                .resizable()
                .scaledToFill()
                .frame(width: 36, height: 36)
                .clipShape(Circle())
                .task {
                    let item = self.viewModel.comments[index].profileImageUrl
                    await self.viewModel.fetchProfilePics(item, index: index)
                }
            
            Text(viewModel.comments[index].username)
                .font(.system(size: 14, weight: .semibold))
            + Text(" \(viewModel.comments[index].commentText)")
                .font(.system(size: 14))
            
            Spacer()
            
            Text(viewModel.comments[index].timestampString ?? "")
                .foregroundColor(.gray)
                .font(.system(size: 12))
        }
        .padding(.horizontal)
    }
}

//struct CommentCell_Previews: PreviewProvider {
//    static var previews: some View {
//        CommentCell()
//    }
//}

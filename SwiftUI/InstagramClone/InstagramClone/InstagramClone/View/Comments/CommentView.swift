//
//  CommentView.swift
//  InstagramClone
//
//  Created by Kim Yewon on 2022/10/23.
//

import SwiftUI

struct CommentView: View {
    
    //MARK: - Properties
    @State var commentText = ""
    @ObservedObject var viewModel: CommentViewModel
    
    init(post: Post) {
        self.viewModel = CommentViewModel(post: post)
    }
    
    //MARK: - Function
    func uploadComment() {
        viewModel.uploadComment(commentText: commentText)
        commentText = ""
    }
    
    //MARK: - Body
    
    var body: some View {
        VStack {
            // comment cells
            
            ScrollView {
                LazyVStack(alignment: .leading, spacing: 24) {
                    ForEach(Array(zip(viewModel.comments.indices, viewModel.comments)), id: \.0) { index, comment in
                        CommentCell(viewModel: viewModel, index: index)
                    }
                }
                .padding(.top)
            }
            
            // input view
            CustomInputView(inputText: $commentText) {
                uploadComment()
                viewModel.commentsUserProfile.append(UIImage(systemName: "x.circle.fill")!)
            }
        }
    }
}

//struct CommentView_Previews: PreviewProvider {
//    static var previews: some View {
//        CommentView()
//    }
//}

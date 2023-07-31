//
//  PostGridView.swift
//  InstagramClone
//
//  Created by Kim Yewon on 2022/10/07.
//

import SwiftUI

struct PostGridView: View {
    
    //MARK: - Properties
    private let items = [GridItem(), GridItem(), GridItem()]
    private let width = UIScreen.main.bounds.width / 3
    let config: PostGridConfiguration
    
    @ObservedObject var viewModel: PostGridViewModel
    
    init(config: PostGridConfiguration) {
        self.config = config
        self.viewModel = PostGridViewModel(config: config)
    }
    
    //MARK: - Function
    
    //MARK: - Body
    
    var body: some View {
        LazyVGrid(columns: items, spacing: 2) {
            
            ForEach(Array(zip(viewModel.posts.indices, viewModel.posts)), id: \.0) { index, post in
                NavigationLink {
                    LazyView(FeedCell(viewModel: FeedCellViewModel(post: post)))
                } label: {
                    Image(uiImage: viewModel.postPics[index] ?? UIImage(systemName: "x.circle.fill")!)
                        .scaledToFit()
                        .frame(width: width, height: width)
                        .clipped()
                        .task {
                            if self.viewModel.postPics[index] == nil {
                                await self.viewModel.fetchPostPics(post.imageUrl, index: index)
                            }
                        }
                        .id(viewModel.postPics[index])
                }
            }
        } //: Navigation
    }//: Loop
    
}



//struct PostGridView_Previews: PreviewProvider {
//    static var previews: some View {
//        PostGridView()
//    }
//}

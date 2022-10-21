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
    @ObservedObject var viewModel: SearchViewModel
    
    //MARK: - Function
    
    //MARK: - Body
    
    var body: some View {
        LazyVGrid(columns: items, spacing: 2) {
            
            ForEach(viewModel.postPics, id: \.self) { postImage in
                
                NavigationLink {
                    FeedView()
                } label: {
                    Image(uiImage: postImage)
                        .scaledToFit()
                        .frame(width: width, height: width)
                        .clipped()
                        .onAppear {
                            viewModel.fetchPostPics()
                        }
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

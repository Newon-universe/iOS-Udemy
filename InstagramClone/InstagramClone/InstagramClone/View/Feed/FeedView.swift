//
//  FeedView.swift
//  InstagramClone
//
//  Created by Kim Yewon on 2022/10/07.
//

import SwiftUI

struct FeedView: View {
    
    //MARK: - Properties
    @ObservedObject var viewModel = FeedViewModel()
    
    //MARK: - Body

    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 32) {
                ForEach(viewModel.posts) { post in
                    FeedCell(post: post)
                }
            }//: LazyVStack
            .padding(.top)
            
            // LazyStack?
            // LazyVStack will be populated by some of network call
            // It doesn't load things on into memory until they're about to come on screen and it loads things out of memory as they disapper from the direct view of the user on the phone screen
            // It makes your memory usage and scrolling much smoother because things are sort of queue and deque, they are also cached so that when we want to.
            // Like, if you go to bottom and scroll up to top, stored memory cache pull out and can be displayed again.
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}

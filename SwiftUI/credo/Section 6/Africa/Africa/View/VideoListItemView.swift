//
//  VideoListItem.swift
//  Africa
//
//  Created by Kim Yewon on 2022/09/06.
//

import SwiftUI

struct VideoListItemView: View {
    //MARK: - PROPERTIES
    
    let video: Video
    
    //MARK: - BODY
    var body: some View {
        HStack {
            ZStack {
                Image(video.thumbnail)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 80)
                    .cornerRadius(8)
                
                Image(systemName: "play.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 32)
                    .shadow(radius: 4)
            }//: ZStack
            
            VStack(alignment: .leading, spacing: 10) {
                Text(video.name)
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundColor(.accentColor)
                
                Text(video.headline)
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
            }//: VStack
            
        }//: HStack
        
    }
}

//MARK: - PREVIEW

struct VideoListItem_Previews: PreviewProvider {
    
    static let video: [Video] = Bundle.main.decode("videos.json")
    
    static var previews: some View {
        VideoListItemView(video: video[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}

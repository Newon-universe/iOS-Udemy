//
//  ContentView.swift
//  CoreDataImage
//
//  Created by Kim Yewon on 2023/08/15.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var photoVM = PhotoViewModel()
    
    var body: some View {
        VStack {
            if let image = photoVM.image {
                Image(uiImage: image)
            }
            
            Button("Download Image") {
                photoVM.downloadImage()
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

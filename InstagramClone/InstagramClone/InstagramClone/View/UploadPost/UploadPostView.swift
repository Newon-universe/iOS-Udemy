//
//  UploadPostView.swift
//  InstagramClone
//
//  Created by Kim Yewon on 2022/10/07.
//

import SwiftUI
import PhotosUI

struct UploadPostView: View {
    
    //MARK: - Properties
    @State private var selectedImage: UIImage? // UIKit
    @State var postImage: Image? // Swift Image
    @State private var captionText = ""
    @State private var imagePickerPresented = false
    
    //MARK: - Function
    
    //MARK: - Body
    
    var body: some View {
        
        VStack {
            
            if postImage == nil {
                Button {
                    imagePickerPresented.toggle()
                } label: {
                    Image(systemName: "photo.circle")
                        .resizable()
                        .renderingMode(.template)
                        .scaledToFill()
                        .frame(width: 180, height: 180)
                        .clipped()
                        .padding(.top, 56)
                        .foregroundColor(.black)
                }.sheet(isPresented: $imagePickerPresented) {
                    loadImage()
                } content: {
                    ImagePicker(image: $selectedImage)
                }

            } else if let image = postImage{
                HStack(alignment: .top) {
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 96, height: 96)
                        .clipped()
                    
                    TextField("Enter your caption.", text: $captionText)
                }//: HStack
                .padding()
                
                
                Button {
                    
                } label: {
                    Text("Share")
                        .font(.system(size: 16, weight: .semibold))
                        .frame(width: 360, height: 50)
                        .background(.blue)
                        .cornerRadius(5)
                        .foregroundColor(.white)
                }
                .padding()

            }
            
            
            Spacer()
        }//: VStack

    }
}

extension UploadPostView {
    func loadImage() {
        guard let selectedImage = selectedImage else { return }
        postImage = Image(uiImage: selectedImage)
    }
}

struct UploadPostView_Previews: PreviewProvider {
    static var previews: some View {
        UploadPostView()
    }
}

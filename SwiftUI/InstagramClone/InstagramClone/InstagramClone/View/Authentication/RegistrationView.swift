//
//  RegistrationView.swift
//  InstagramClone
//
//  Created by Kim Yewon on 2022/10/08.
//

import SwiftUI

struct RegistrationView: View {
    
    //MARK: - Properties
    @State private var email = ""
    @State private var fullname = ""
    @State private var username = ""
    @State private var password = ""
    @Environment(\.dismiss) var mode
    @EnvironmentObject var viewModel: AuthViewModel
    
    @State private var selectedImage: UIImage? // UIKit
    @State var postImage: Image? // Swift Image
    @State private var imagePickerPresented = false
    
    //MARK: - Body

    
    var body: some View {
        ZStack {
            LinearGradient(
                gradient:
                    Gradient(colors: [.pink.opacity(0.35), .blue]),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    if let image = postImage {
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 140, height: 140)
                            .foregroundColor(.white)
                            .clipShape(Circle())
                            .onTapGesture {
                                imagePickerPresented.toggle()
                            }
                    } else {
                        Button {
                            imagePickerPresented.toggle()
                        } label: {
                            Image(systemName: "photo.circle")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 140, height: 140)
                                .foregroundColor(.white)
                        }
                    }
                }//: ZStack
                .sheet(isPresented: $imagePickerPresented) {
                    loadImage()
                } content: {
                    ImagePicker(image: $selectedImage)
                }
                .padding(.top, 44)
                .padding(.bottom)
                
                // email field
                
                VStack(spacing: 20) {
                    CustomTextField(
                        text: $email,
                        placeholder: Text("Email"),
                        imgName: "envelope"
                    )
                    .padding()
                    .background(.white.opacity(0.15))
                    .cornerRadius(10)
                    .foregroundColor(.white)
                    .padding(.horizontal)
                    
                    CustomTextField(
                        text: $username,
                        placeholder: Text("User Name"),
                        imgName: "person"
                    )
                    .padding()
                    .background(.white.opacity(0.15))
                    .cornerRadius(10)
                    .foregroundColor(.white)
                    .padding(.horizontal)
                    
                    CustomTextField(
                        text: $fullname,
                        placeholder: Text("Full Name"),
                        imgName: "person"
                    )
                    .padding()
                    .background(.white.opacity(0.15))
                    .cornerRadius(10)
                    .foregroundColor(.white)
                    .padding(.horizontal)
                    
                    // password field
                    CustomSecureField(
                        text: $password,
                        placeholder: Text("Password")
                    )
                    .padding()
                    .background(.white.opacity(0.15))
                    .cornerRadius(10)
                    .foregroundColor(.white)
                    .padding(.horizontal)
                }
                
                // sign Up
                Button {
                    viewModel.signUp(withEmail: email, password: password, image: selectedImage, fullname: fullname, username: username)
                } label: {
                    Text("Sign Up")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 360, height: 50)
                        .background(.purple)
                        .clipShape(Capsule())
                        .padding()
                }

                // go to sign up
                
                Spacer()

                Button {
                    mode.callAsFunction()
                } label: {
                    HStack {
                        Text("Already Have an account?")
                            .font(.system(size: 14))
                        
                        Text("Sign In")
                            .font(.system(size: 14, weight: .semibold))
                    }
                    .foregroundColor(.white)
                }
                .padding(.bottom)
                
            }//: VStack
        }
    }
}

extension RegistrationView {
    func loadImage() {
        guard let selectedImage = selectedImage else { return }
        postImage = Image(uiImage: selectedImage)
    }
}


struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}

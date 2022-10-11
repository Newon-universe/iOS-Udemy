//
//  LoginView.swift
//  InstagramClone
//
//  Created by Kim Yewon on 2022/10/08.
//

import SwiftUI

struct LoginView: View {
    //MARK: - Properties
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject var viewModel: AuthViewModel
    
    //MARK: - Body
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(
                    gradient:
                        Gradient(colors: [.pink.opacity(0.35), .blue]),
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()
                
                VStack {
                    Image("instagram_title")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 220, height: 100)
                        .foregroundColor(.white)
                    
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
                    
                    // forgot password
                    HStack {
                        Spacer()
                        
                        Button {
                            
                        } label: {
                            Text("Forgor Password?")
                                .font(.system(size: 13, weight: .semibold))
                                .foregroundColor(.white)
                                .padding([.top, .trailing])
                        }
                    }
                    
                    // sign in
                    
                    Button {
                        viewModel.logIn()
                    } label: {
                        Text("Sign In")
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
                        
                    } label: {
                        NavigationLink {
                            RegistrationView()
                                .navigationBarHidden(true)
                        } label: {
                            HStack {
                                Text("Don't have account?")
                                    .font(.system(size: 14))
                                
                                Text("Sign Up")
                                    .font(.system(size: 14, weight: .semibold))
                            }
                            .foregroundColor(.white)
                        }//: NavigationLink
                        .padding(.bottom)
                        
                    }//: Button
                    .padding(.bottom)
                    
                }//: VStack
                .padding(.top, -44)
            }
        }
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

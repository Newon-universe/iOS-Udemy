//
//  ResetPasswordView.swift
//  InstagramClone
//
//  Created by Kim Yewon on 2022/10/08.
//

import SwiftUI

struct ResetPasswordView: View {
    //MARK: - Properties
    @EnvironmentObject var viewModel: AuthViewModel
    @Environment(\.presentationMode) var mode
    @Binding var email: String
    //MARK: - Function
    
    init(email: Binding<String>) {
        self._email = email
    }
    
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
                    
                }
                
                // sign in
                Button {
                    viewModel.resetPassword(withEmail: email)
                } label: {
                    Text("Send Reset Password Link")
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
                    mode.wrappedValue.dismiss()
                } label: {
                    HStack {
                        Text("Already Have an account?")
                            .font(.system(size: 14))
                        
                        Text("Sign In")
                            .font(.system(size: 14, weight: .semibold))
                    }
                    .foregroundColor(.white)
                    
                }//: Button
                .padding(.bottom)
                
            }//: VStack
            .padding(.top, -44)
        }
        .onReceive(viewModel.$didSendResetPasswordLink) { _ in
            self.mode.wrappedValue.dismiss()
        }
    }
}

//struct ResetPasswordView_Previews: PreviewProvider {
//    static var previews: some View {
//        ResetPasswordView()
//    }
//}

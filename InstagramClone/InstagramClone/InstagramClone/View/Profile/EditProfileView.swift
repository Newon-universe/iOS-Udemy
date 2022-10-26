//
//  EditProfileView.swift
//  InstagramClone
//
//  Created by Kim Yewon on 2022/10/26.
//

import SwiftUI

struct EditProfileView: View {
    
    @State private var bioText: String
    @ObservedObject private var viewModel: EditProfileViewModel
    @Binding var user: User
    @Environment(\.presentationMode) var mode
    
    init(user: Binding<User>) {
        self._user = user
        self.viewModel = EditProfileViewModel(user: self._user.wrappedValue)
        self._bioText = State(initialValue: _user.wrappedValue.bio ?? "")
    }
    
    var body: some View {
        
        VStack {
            HStack {
                Button {
                    mode.wrappedValue.dismiss()
                } label: {
                    Text("Cancel")
                }
                
                Spacer()
                
                Button {
                    viewModel.saveUserData(bioText)
                } label: {
                    Text("Done")
                        .bold()
                }
            }//: HStack
            .padding()
            
            TextArea(placeholder: "Add your bio...", text: $bioText)
                .frame(width: 370, height: 200)
            
            Spacer()
        }
        .onReceive(viewModel.$uploadComplete) { completed in
            if completed {
                self.mode.wrappedValue.dismiss()
                self.user.bio = viewModel.user.bio
            }
        }
    }
    
}

//struct EditProfileView_Previews: PreviewProvider {
//    static var previews: some View {
//        EditProfileView()
//    }
//}

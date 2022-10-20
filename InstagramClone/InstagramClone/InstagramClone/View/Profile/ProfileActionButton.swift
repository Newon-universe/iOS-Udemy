//
//  ProfileActionButton.swift
//  InstagramClone
//
//  Created by Kim Yewon on 2022/10/08.
//

import SwiftUI

struct ProfileActionButton: View {
    
    //MARK: - Properties
    @ObservedObject var viewModel: ProfileViewModel
    var isFollwed: Bool { return viewModel.user.isFollowed ?? false }
    
    //MARK: - Function
    
    //MARK: - Body
    
    var body: some View {
        if viewModel.user.isCurrentUser {
            Button {
                
            } label: {
                Text("Edit Profile")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(.black)
                    .frame(width: 360, height: 32)
                    .overlay {
                        RoundedRectangle(cornerRadius: 3)
                            .stroke(.gray, lineWidth: 1)
                    }
            }
        } else {
            // follow and message button
            HStack {
                Button {
                    isFollwed ? viewModel.unfolllow() : viewModel.follow()
                } label: {
                    Text(isFollwed ? "Following" : "Follow")
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(isFollwed ? .black : .white)
                        .frame(width: 172, height: 32)
                        .overlay {
                            RoundedRectangle(cornerRadius: 3)
                                .stroke(.gray, lineWidth: isFollwed ? 1 : 0)
                        }
                }
                .background(isFollwed ? .white : .blue)
                .cornerRadius(3)
                
                Button {
                    
                } label: {
                    Text("Message")
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(.black)
                        .frame(width: 172, height: 32)
                        .overlay {
                            RoundedRectangle(cornerRadius: 3)
                                .stroke(.gray, lineWidth: 1)
                        }
                }
            }
        }
    }
}

//struct ProfileActionButton_Previews: PreviewProvider {
//    static var previews: some View {
//        ProfileActionButton()
//    }
//}

//
//  ProfileHeaderView.swift
//  InstagramClone
//
//  Created by Kim Yewon on 2022/10/08.
//

import SwiftUI

struct ProfileHeaderView: View {
    var body: some View {
        VStack(alignment: .leading) {
            
            HStack {
                
                VStack {
                    Image("astronut")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 80, height: 80)
                        .clipShape(Circle())
                        .padding(.leading)
                    
                }
                
                Spacer()
                
                HStack {
                    UserStatView(value: 1, title: "Post")
                    UserStatView(value: 2, title: "Followers")
                    UserStatView(value: 3, title: "Follwing")
                } //: HStack
                .padding(.trailing)
            }//: HStack
            
            Text("Astronut")
                .font(.system(size: 15, weight: .semibold))
                .padding(.leading, 25)
                .padding(.top)
            
            Text("Astronut who move to next")
                .font(.system(size: 15))
                .padding([.leading], 25)
                .padding(.top, -7)
            
            HStack {
                Spacer()
                
                ProfileActionButton()
                
                Spacer()
            }//: HStack
            .padding(.top)

        }
    }
}

struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView()
    }
}

//
//  ProfileView.swift
//  InstagramClone
//
//  Created by Kim Yewon on 2022/10/07.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 32) {
                ProfileHeaderView()
                
                PostGridView()
            } //: VStack
            .padding(.top)
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

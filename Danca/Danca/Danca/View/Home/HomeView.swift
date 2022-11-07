//
//  HomeView.swift
//  Danca
//
//  Created by Kim Yewon on 2022/11/05.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        HStack(alignment: .center) {
            
            ProfileView()
            
            ZStack() {
                Text("HAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHA")
            }
            
        } //: HStack
    }
}


struct ProfileView: View {
    var body: some View {
        ZStack {

            HStack {
                Spacer()
                
                Image(systemName: "chevron.backward")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 24, height: 24)
            }
            
            VStack {
                Spacer()
                
                
            }

        }
        .padding(.horizontal, 100)
        .background (
            Image("inside_solo")
                .resizable()
                .frame(width: 500)
                .aspectRatio(contentMode: .fill)
        )
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .previewInterfaceOrientation(.landscapeRight)
    }
}

//
//  MusicAppGeometryView.swift
//  New in SwiftUI
//
//  Created by Kim Yewon on 2022/09/29.
//

import SwiftUI


struct MusicPlayerBar: View {
    
    //It is better pass the namespace for this view from origin
    let namespace: Namespace.ID
    
    var body: some View {
        HStack(alignment: .center) {
            Image("cover")
                .resizable()
                .frame(width: 50, height: 50)
                .cornerRadius(4)
                .padding()
                .matchedGeometryEffect(id: "music", in: namespace)
            
            Spacer()
            
            Text("Summer")
                .font(.headline)
            
            Spacer()
            
            Image(systemName: "play.fill")
            Image(systemName: "forward.fill")
                .padding(.trailing, 10)
            
        }
        .padding(.top, 27)
        .frame(maxWidth: .infinity, maxHeight: 60)
        .background(.gray.opacity(0.5))
    }
}

struct MusicPlayer: View {
    
    let namespace: Namespace.ID
    
    var body: some View {
        VStack {
            Image("cover")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(10)
                .padding(40)
                .matchedGeometryEffect(id: "music", in: namespace)
            
            HStack {
                VStack(alignment: .leading) {
                    Text("Summer")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                    
                    Text("The Volunteer")
                        .font(.title)
                        .fontWeight(.light)
                        .opacity(0.5)
                        .foregroundColor(.black)
                }
                .padding()
                .padding(.leading, 25)
                
                Spacer()
            }
            
            HStack(alignment: .center) {
                Image(systemName: "backward.fill")
                    .foregroundColor(.black)
                    .font(.system(size: 30))
                
                Image(systemName: "play.fill")
                    .foregroundColor(.black)
                    .font(.system(size: 30))
                    .padding([.leading, .trailing], 75)
                
                Image(systemName: "forward.fill")
                    .foregroundColor(.black)
                    .font(.system(size: 30))
            }
            .padding(.top, 20)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct MusicAppGeometryView: View {
    
    @State private var showDetails: Bool = false
    @Namespace private var ns
    
    var body: some View {
        VStack {
            Spacer()
            
            if showDetails {
                MusicPlayer(namespace: ns)
            } else {
                MusicPlayerBar(namespace: ns)
            }
        }
        .onTapGesture {
            withAnimation(.spring()) {
                showDetails.toggle()
            }
        }
    }
}

struct MusicAppGeometryView_Previews: PreviewProvider {
    static var previews: some View {
        MusicAppGeometryView()
    }
}

//
//  ContentView.swift
//  Hello-SwiftUI
//
//  Created by Kim Yewon on 2022/09/19.
//

import SwiftUI

struct ContentView: View {
    
    //Body can not have multiple child.
    
    var body: some View {
        
        VStack(alignment: .center) {
            
            Image("totoro")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(20)
                .padding(.all)
//                .clipShape(Circle())
            
            Text("First Line")
                .font(.largeTitle)
                .foregroundColor(.green)
            
            Text("Second Line")
                .font(.title)
                .foregroundColor(.orange)
            
            HStack {
                Text("Left Side")
                Text("Right Side")
                    .padding(.all)
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

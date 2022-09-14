//
//  CreditView.swift
//  Note WatchKit Extension
//
//  Created by Kim Yewon on 2022/09/14.
//

import SwiftUI

struct CreditView: View {
    //MARK: - Property
    
    @State private var randomNumber: Int = Int.random(in: 1..<4)
    private var randomImage: String {
        return "developer-no\(randomNumber)"
    }
    
    //MARK: - Body
    var body: some View {
        VStack(spacing: 3) {
            // Profile
            Image(randomImage)
                .resizable()
                .scaledToFit()
                .layoutPriority(1)
            
            // Header
            HeaderView(title: "Credits")
            
            // Content
            Text("Yewon Kim")
                .foregroundColor(.primary)
                .fontWeight(.bold)
            
            Text("Developer")
                .font(.footnote)
                .foregroundColor(.secondary)
                .fontWeight(.light)
            
            // Footer
            
        }
    }
}

//MARK: - Preview
struct CreditView_Previews: PreviewProvider {
    static var previews: some View {
        CreditView()
    }
}

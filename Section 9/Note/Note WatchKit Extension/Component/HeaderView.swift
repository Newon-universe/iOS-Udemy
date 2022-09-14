//
//  HeaderView.swift
//  Note WatchKit Extension
//
//  Created by Kim Yewon on 2022/09/14.
//

import SwiftUI

struct HeaderView: View {
    //MARK: - Property
    
    var title: String = ""
    
    //MARK: - Body
    var body: some View {
        VStack {
            // Title
            
            if title != "" {
                Text(title.uppercased())
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.accentColor)
            }
            
            // Separator
            HStack {
                Capsule()
                    .frame(height: 1)
                
                Image(systemName: "note.text")
                
                Capsule()
                    .frame(height: 1)
            }
            .foregroundColor(.accentColor)
        } //: VStack
    }
}

//MARK: - Preview
struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HeaderView(title: "Inerane Title")
            HeaderView()
        }
    }
}

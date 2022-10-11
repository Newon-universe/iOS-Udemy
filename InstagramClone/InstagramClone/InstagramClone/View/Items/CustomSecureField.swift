//
//  CustomSecureField.swift
//  InstagramClone
//
//  Created by Kim Yewon on 2022/10/08.
//

import SwiftUI

struct CustomSecureField: View {
    
    //MARK: - Properties
    @Binding var text: String
    let placeholder: Text
    
    //MARK: - Function
    
    
    //MARK: - Body
    
    var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty {
                placeholder
                    .foregroundColor(.white.opacity(0.8))
                    .padding(.leading, 40)
            }
            
            HStack {
                Image(systemName: "lock")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.white)
                
                SecureField("", text: $text)
            }
            
        }
    }
}

//
//  CustomTextField.swift
//  InstagramClone
//
//  Created by Kim Yewon on 2022/10/08.
//

import SwiftUI

struct CustomTextField: View {
    
    //MARK: - Properties
    @Binding var text: String
    let placeholder: Text
    let imgName: String
    
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
                Image(systemName: imgName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.white)
                
                TextField("", text: $text)
            }
            
        }
    }
}

struct CustomTextField_Previews: PreviewProvider {
    static var previews: some View {
        CustomTextField(
            text: .constant(""),
            placeholder: Text("Email"),
            imgName: "envelope"
        )
    }
}

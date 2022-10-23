//
//  CustomInputView.swift
//  InstagramClone
//
//  Created by Kim Yewon on 2022/10/23.
//

import SwiftUI

struct CustomInputView: View {
    
    @Binding var inputText: String
    
    var action: () -> Void
    
    var body: some View {
        VStack {
            // divider
            Rectangle()
                .foregroundColor(Color.gray)
                .frame(width: UIScreen.main.bounds.width, height: 0.75)
                .padding(.bottom, 8)
            
            // HStack
            HStack {
                TextField(text: $inputText) {
                    Text("Message...")
                }
                .textFieldStyle(PlainTextFieldStyle())
                .frame(minHeight: 30)
                
                Button {
                    action()
                } label: {
                    Text("Send")
                        .bold()
                        .foregroundColor(.blue)
                }
                
            }//: HStack
            .padding([.horizontal, .bottom])
        }
    }
}

//struct CustomInputView_Previews: PreviewProvider {
//    static var previews: some View {
//        CustomInputView(inputText: .constant(""))
//    }
//}

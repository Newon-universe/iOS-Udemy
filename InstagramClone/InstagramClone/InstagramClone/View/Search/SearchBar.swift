//
//  SearchBar.swift
//  InstagramClone
//
//  Created by Kim Yewon on 2022/10/07.
//

import SwiftUI

struct SearchBar: View {
    //MARK: - Properties
    @Binding var text: String
    @Binding var isEditing: Bool
    @Binding var isChange: Bool
    @FocusState private var isFocused: Bool
    
    //MARK: - Function
    
    //MARK: - Body
    
    var body: some View {
        HStack {
            TextField("Search...", text: $text)
                .padding(8)
                .padding(.horizontal, 24)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .overlay {
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .frame(
                                minWidth: 0,
                                maxWidth: .infinity,
                                alignment: .leading
                            )
                            .padding(.leading, 8)
                    }
                }
                .onTapGesture {
                    withAnimation {
                        isEditing = true                        
                    }
                    isChange = true
                }
                .focused($isFocused)
            
            if isEditing {
                Button {
                    text = ""
                    withAnimation {
                        isEditing = false
                    }
                    isChange = false
                    isFocused = false
                    
//                    UIApplication.shared.endEditing()
                    
                } label: {
                    Text("Cancel")
                        .foregroundColor(.black)
                }
                .padding(.trailing, 8)
                .transition(.move(edge: .trailing))
//                .animation(.default, value: isEditing)
            }
        }
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(text: .constant(""), isEditing: .constant(true), isChange: .constant(true))
    }
}

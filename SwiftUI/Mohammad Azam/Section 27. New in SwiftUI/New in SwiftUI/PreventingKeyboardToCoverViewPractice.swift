//
//  PreventingKeyboardToCoverViewPractice.swift
//  New in SwiftUI
//
//  Created by Kim Yewon on 2022/09/29.
//

import SwiftUI

struct PreventingKeyboardToCoverViewPractice: View {
    
    @State private var name: String = ""
    @State private var age: String = ""
    
    var body: some View {
        VStack(spacing: 10) {
            Spacer()
            TextField("Name", text: $name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            TextField("Age", text: $age)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }
        .padding()
    }
}

struct PreventingKeyboardToCoverViewPractice_Previews: PreviewProvider {
    static var previews: some View {
        PreventingKeyboardToCoverViewPractice()
    }
}

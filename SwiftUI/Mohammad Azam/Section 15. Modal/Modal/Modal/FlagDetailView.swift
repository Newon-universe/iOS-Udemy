//
//  FlagDetailView.swift
//  Modal
//
//  Created by Kim Yewon on 2022/09/28.
//

import SwiftUI

struct FlagDetailView: View {
    
    @Binding var flagVM: FlagViewModel
    
    var body: some View {
        VStack {
            Text(flagVM.flag)
                .font(.custom("Arial", size: 200))
            
            TextField("Enter country name", text: $flagVM.country)
                .padding()
                .fixedSize()
            
            Button {
                flagVM.showModal.toggle()
            } label: {
                Text("Submit")
            }

        }
    }
}

struct FlagDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FlagDetailView(flagVM: .constant(FlagViewModel()))
    }
}

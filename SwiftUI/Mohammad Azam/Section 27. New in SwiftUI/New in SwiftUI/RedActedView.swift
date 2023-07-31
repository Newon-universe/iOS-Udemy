//
//  RedActedView.swift
//  New in SwiftUI
//
//  Created by Kim Yewon on 2022/09/29.
//

import SwiftUI

struct RedActedView: View {
    
    @State private var isRedacted: Bool = true
    
    var body: some View {
        VStack(spacing: 10) {
            Toggle(isOn: $isRedacted) {
                Text("Redacted")
            }
            
            Spacer()
            
            Text("Newon")
            HStack{
                Text("Bank Account:")
                Text("123-456-78910")
                    .redacted(reason: isRedacted ? .placeholder : .init())
            }
            Spacer()
        }
        .padding()
        
    }
}

struct RedActedView_Previews: PreviewProvider {
    static var previews: some View {
        RedActedView()
    }
}

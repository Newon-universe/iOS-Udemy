//
//  MatchedGeometryEffectView.swift
//  New in SwiftUI
//
//  Created by Kim Yewon on 2022/09/29.
//

import SwiftUI

struct MatchedGeometryEffectView: View {
    
    @State private var isSwitched: Bool = false
    @Namespace private var ns
    
    var body: some View {
        HStack {
            
            if !isSwitched {
                Circle()
                    .fill(.red)
                    .frame(width: 50, height: 50)
                    .matchedGeometryEffect(id: "animation", in: ns)
                // ID should match between unique views you want to matched
                // Namespace make id is unique even it is being in other files
                
                                
            }
            
            Spacer()
            
            Button {
                withAnimation {
                    isSwitched.toggle()
                }
            } label: {
                Text("Switch")
            }
            
            Spacer()
            
            VStack {
                Circle()
                    .fill(.red)
                    .frame(width: 50, height: 50)
                
                if isSwitched {
                    Circle()
                        .fill(.green)
                        .matchedGeometryEffect(id: "animation", in: ns)
                }
                
                
                Circle()
                    .fill(.red)
                    .frame(width: 50, height: 50)
            }
            

        }
    }
}

struct MatchedGeometryEffectView_Previews: PreviewProvider {
    static var previews: some View {
        MatchedGeometryEffectView()
    }
}

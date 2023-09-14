//
//  CustomTabBarButton.swift
//  Giphy-iOS
//
//  Created by Kim Yewon on 2023/09/14.
//

import SwiftUI

struct CustomTabBarButton: View {
    @Binding var action: () -> Void
    let images: [Color]
    let image: String
    
    var body: some View {
        Button {
            action()
        } label: {
            Image(systemName: image)
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(
                            LinearGradient(
                                colors: images,
                                startPoint: .leading,
                                endPoint: .trailing
                            ),
                            lineWidth: 5
                        )
                )
        }
    }
}

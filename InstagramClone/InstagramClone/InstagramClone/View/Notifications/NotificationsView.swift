//
//  NotificationView.swift
//  InstagramClone
//
//  Created by Kim Yewon on 2022/10/07.
//

import SwiftUI

struct NotificationsView: View {
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 10) {
                ForEach(0 ..< 20) { _ in
                    NotificationCell()
                }
            }
        }
    }
}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationsView()
    }
}

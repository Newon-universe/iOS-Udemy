//
//  Notification.swift
//  Form
//
//  Created by Kim Yewon on 2022/09/27.
//

import SwiftUI

struct Notification: View {
    var body: some View {
        NavigationView {
            Form {
                Section {
                    HStack {
                        Text("Show Previews")
                        Spacer()
                        NavigationLink {
                            
                        } label: {
                            Text("Always")
                                .foregroundColor(.gray)
                        }
                        .fixedSize()
                    }
                } header: {
                    Text("")
                } //: Section
                
                Section {
                    NavigationLink {
                        
                    } label: {
                        Text("Siri Suggestions")
                    }
                } header: {
                    Text("Notification previews will be shown whether the iPhone is locked or unlocked")
                        .padding()
                        .foregroundColor(.gray)
                        .lineLimit(nil)
                } //: Section
                
                Section {
                    
                    ForEach(1 ... 10, id: \.self) { index in
                        HStack {
                            Text("\(index)")
                        }
                    }
                    
                } header: {
                    VStack(alignment: .leading) {
                        Text("Choose while apps can suggest shortcuts on the lock screen")
                            .lineLimit(nil)
                            .padding(2)
                        Text("NOTIFICATION STYLE")
                            .padding(2)
                    }
                } //: Section
                .navigationTitle("Notification")
                .navigationBarTitleDisplayMode(.inline)
                
            }
        }
    }
}

struct Notification_Previews: PreviewProvider {
    static var previews: some View {
        Notification()
    }
}

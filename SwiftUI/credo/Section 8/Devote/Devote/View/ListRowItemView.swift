//
//  ListRowItemView.swift
//  Devote
//
//  Created by Kim Yewon on 2022/09/14.
//

import SwiftUI

struct ListRowItemView: View {
    //MARK: - Property
    
    @Environment(\.managedObjectContext) var viewContext
    @ObservedObject var item: Item
    
    //MARK: - Body
    var body: some View {
        Toggle(isOn: $item.completion) {
            Text(item.task ?? "")
                .font(.system(.title2, design: .rounded))
                .fontWeight(.heavy)
                .foregroundColor(item.completion ? .pink : .primary)
                .padding(.vertical, 12)
                .animation(.default, value: true)
        } //: Toggle
        .toggleStyle(CheckboxStyle())
        .onReceive(item.objectWillChange) { _ in
            if self.viewContext.hasChanges {
                try? self.viewContext.save()
            }
        }
        .onTapGesture {
            item.completion.toggle()
            
            feedback.notificationOccurred(.success)
            
            if item.completion {
                playSound(sound: "sound-rise", type: "mp3")
            } else {
                playSound(sound: "sound-tap", type: "mp3")
            }
        }
    }
}

////MARK: - Preview
//struct ListRowItemView_Previews: PreviewProvider {
//    static var previews: some View {
//        ListRowItemView()
//    }
//}

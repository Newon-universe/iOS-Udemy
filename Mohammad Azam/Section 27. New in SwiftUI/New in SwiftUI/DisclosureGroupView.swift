//
//  DisclosureGroupView.swift
//  New in SwiftUI
//
//  Created by Kim Yewon on 2022/09/29.
//

import SwiftUI

struct DisclosureGroupView: View {
    
    @State private var animalsExpanded: Bool = true
    @State private var fruitsExpanded: Bool = true
    let animals = ["🙉", "🦋", "🦈", "🦕"]
    let fruits = ["🍅", "🍇", "🍈", "🍉"]
    
    var body: some View {
        Form {
            DisclosureGroup("Animals", isExpanded: $animalsExpanded) {
                HStack {
                    ForEach(animals, id: \.self) { animal in
                        Text(animal)
                            .font(.system(size: 50))
                    }
                }
            }//: Disclosure Group
            
            DisclosureGroup("Fruits", isExpanded: $fruitsExpanded) {
                HStack {
                    ForEach(fruits, id: \.self) { fruit in
                        Text(fruit)
                            .font(.system(size: 50))
                    }
                }
            }
        }
    }
}

struct DisclosureGroupView_Previews: PreviewProvider {
    static var previews: some View {
        DisclosureGroupView()
    }
}

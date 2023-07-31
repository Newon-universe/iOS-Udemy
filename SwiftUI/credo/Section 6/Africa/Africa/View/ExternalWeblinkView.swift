//
//  ExternalWeblinkView.swift
//  Africa
//
//  Created by Kim Yewon on 2022/09/05.
//

import SwiftUI

struct ExternalWeblinkView: View {
    //MARK: - PROPERTIES
    
    let animal: Animal
    
    //MARK: - BODY
    var body: some View {
        GroupBox {
            HStack {
                Image(systemName: "globe")
                Text("Wikipedia")
                Spacer()
                
                Group {
                    Image(systemName: "arrow.up.right.square")
                    
                    Link(
                        destination: URL(string: animal.link ?? "https://wikipedia.org")!
                    ) {
                        Text(animal.name)
                    }
                }
                .foregroundColor(.accentColor)
            } //: HStack
        } //: BOX
    }
}

//MARK: - PREVIEW
struct ExternalWeblinkView_Previews: PreviewProvider {
    static let animals: [Animal] = Bundle.main.decode("animals.json")
    
    static var previews: some View {
        ExternalWeblinkView(animal: animals[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}

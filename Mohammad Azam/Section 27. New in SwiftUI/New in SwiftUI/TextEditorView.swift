//
//  TextEditor.swift
//  New in SwiftUI
//
//  Created by Kim Yewon on 2022/09/29.
//

import SwiftUI

struct TextEditorView: View {
    @State private var description: String = ""
    
    var body: some View {
        VStack {
            TextEditor(text: $description)
        }
    }
}

struct TextEditor_Previews: PreviewProvider {
    static var previews: some View {
        TextEditorView()
    }
}

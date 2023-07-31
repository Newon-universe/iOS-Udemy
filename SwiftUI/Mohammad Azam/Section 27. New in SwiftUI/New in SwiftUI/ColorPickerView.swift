//
//  ColorPicker.swift
//  New in SwiftUI
//
//  Created by Kim Yewon on 2022/09/29.
//

import SwiftUI

struct ColorPickerView: View {
    
    @State private var color: Color = Color.white
    
    var body: some View {
        Text("\(color.description)")
            .font(.title)
        ColorPicker("", selection: $color)
    }
}

struct ColorPicker_Previews: PreviewProvider {
    static var previews: some View {
        ColorPickerView()
    }
}

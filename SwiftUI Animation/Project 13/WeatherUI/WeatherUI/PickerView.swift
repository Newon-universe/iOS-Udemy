//
//  PickerView.swift
//  WeatherUI
//
//  Created by Kim Yewon on 2022/11/18.
//

import SwiftUI

struct PickerView: View {
    
    @Binding var pickerSelection: Int
    
    var body: some View {
        Picker(selection: $pickerSelection) {
            Text("Temperature 🌡").tag(0)
            Text("Precipitation 🌧").tag(1)
            Text("Wind 💨").tag(2)
        } label: {
            
        }
        .pickerStyle(SegmentedPickerStyle())
        .background(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.black, lineWidth: 2)
                .shadow(color: Color.black, radius: 8, x: 0, y: 0)
        )
        .cornerRadius(8)
        .padding(15)
        
    }
}

struct PickerView_Previews: PreviewProvider {
    static var previews: some View {
        PickerView(pickerSelection: .constant(3))
            .previewLayout(.sizeThatFits)
    }
}

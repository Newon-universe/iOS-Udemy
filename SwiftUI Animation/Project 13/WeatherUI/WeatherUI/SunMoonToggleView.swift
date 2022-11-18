//
//  SunMoonToggleView.swift
//  WeatherUI
//
//  Created by Kim Yewon on 2022/11/18.
//

import SwiftUI
import SunMoonToggleStyle

struct SunMoonToggleView: View {
    
    @Binding var isOn: Bool
    
    func label() -> Text {
        isOn ? Text("Moon").bold() : Text("Sun").bold()
    }
    
    var body: some View {
        
        HStack {
            Toggle(isOn: $isOn, label: label)
                .toggleStyle(SunMoonToggleStyle())
                .padding(.horizontal, 134)
        }
        
        
    }
}

struct SunMoonToggleView_Previews: PreviewProvider {
    static var previews: some View {
        SunMoonToggleView(isOn: .constant(true))
    }
}

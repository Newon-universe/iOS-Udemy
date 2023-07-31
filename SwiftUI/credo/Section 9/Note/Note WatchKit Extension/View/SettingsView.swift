//
//  Settings.swift
//  Note WatchKit Extension
//
//  Created by Kim Yewon on 2022/09/14.
//

import SwiftUI

struct SettingsView: View {
    //MARK: - Property
    
    @AppStorage("lineCount") var lineCount: Int = 1 // work like State
    @State private var value: Float = 1.0
    
    //MARK: - Function
    
    func update() {
        lineCount = Int(value)
    }
    
    //MARK: - Body
    var body: some View {
        VStack(spacing: 8) {
            // Header
            HeaderView(title: "Settings")
            
            // Actual Line Count
            Text("Lines: \(lineCount)".uppercased())
                .fontWeight(.bold)
            
            
            
            // Slider
            Slider(value: Binding(
                get: { self.value },
                set: { newValue in
                    self.value = newValue
                    self.update()
                }), in: 1...4, step: 1)
            .tint(.accentColor)
            
        } //: VStack
    }
}


//MARK: - Preview
struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}

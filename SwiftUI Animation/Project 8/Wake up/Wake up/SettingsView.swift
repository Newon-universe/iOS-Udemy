//
//  SettingsView.swift
//  Wake up
//
//  Created by Kim Yewon on 2022/11/11.
//

import SwiftUI

struct SettingsView: View {
    
    @State private var selection: Int = 1
    @State private var setDate = Date()
    @State private var timeZoneOverride = true
    @State private var volume: Double = 25.0
    @Binding var show: Bool
    
    var body: some View {
        ZStack {
            NavigationView {
                List {
                    // Date Picker
                    Section {
                        DatePicker(selection: $setDate) {
                            Image(systemName: "calendar.circle")
                        }
                        .foregroundColor(.black)
                    } header: {
                        Text("Date and Time")
                    }
                    .listRowBackground(Color.orange)
                    
                    // time zone toggle
                    Section {
                        Toggle(isOn: $timeZoneOverride) {
                            HStack {
                                Image(systemName: "timer")
                                Text("Override")
                            }
                            .foregroundColor(.black)
                        }
                    } header: {
                        Text("Time Zone OVerride.")
                    }
                    .listRowBackground(Color.orange)
                    
                    // alarm volume
                    Section {
                        Slider(value: $volume, in: 0...100) { _ in
                            
                        }
                    } header: {
                        Text("Volume \(String(format: "%.0f", volume as Double))")
                            .foregroundColor(.black)
                    }
                    .listRowBackground(Color.orange)
                    
                    // repeat alarm picker
                    Section {
                        Picker(selection: $selection) {
                            Text("No Repeat").tag(1)
                            Text("Repeat Once").tag(2)
                            Text("Repeat Twice").tag(3)
                        } label: {
                            Text("Repeat Alarm")
                        }
                        .foregroundColor(.black)
                    } header: {
                        Text("Repeat Alarm")
                    }
                    .listRowBackground(Color.orange)
                    
                    // save button
                    Button {
                        withAnimation(.easeInOut(duration: 1.0)) {
                            self.show = false
                        }
                    } label: {
                        HStack {
                            Spacer()
                            Text("Save")
                            Spacer()
                        }
                        .foregroundColor(.white)
                    }
                    .listRowBackground(Color.green)
                }
                .listStyle(InsetGroupedListStyle())
            }
            .frame(width: 350, height: 625)
            .cornerRadius(20)
            
            Text("Settings")
                .offset(y: -250)
                .foregroundColor(.black)
                .font(.title)
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(show: .constant(false))
    }
}

//
//  ContentView.swift
//  Form
//
//  Created by Kim Yewon on 2022/09/27.
//

import SwiftUI

struct ContentView: View {
    
    @State private var scheduled: Bool = false
    @State private var manuallyEnalbedTillTomorrow: Bool = false
    @State private var colorTemperature: CGFloat = 0.5
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Toggle(
                        "Scheduled",
                        isOn: $scheduled
                    )
                    
                    HStack {
                        VStack(alignment: .leading) {
                            Text("From")
                            Text("To")
                        }//: VStack
                        
                        Spacer()
                        
                        
                        
                        NavigationLink {
                            
                        } label: {
                            VStack(alignment: .trailing) {
                                Text("Sunset")
                                    .foregroundColor(.accentColor)
                                Text("Stunrise")
                                    .foregroundColor(.accentColor)
                            }
                            .padding(.trailing, 10)
                        }//: NavigationLink
                        .fixedSize()

                    }//: HStack
                    
                } header: {
                    Text("Night Shift automatically shifts the colors of your display to the warmer end of the color spectrum after dark. This may help you get a better night's sleep")
                        .padding() // padding default : 12
                        .lineLimit(nil)
                        .font(.caption)
                } //: Section
                .navigationTitle("Night Shift Mode")
                .navigationBarTitleDisplayMode(.large)
                
                Section {
                    Toggle(
                        "Manually Enable Until Tomorrow",
                        isOn: $manuallyEnalbedTillTomorrow
                    )
                } header: {
                    
                } //: Section
                
                Section {
                    VStack {
                        HStack {
                            Text("Less Warm")
                            Spacer()
                            Text("More Warm")
                        }
                        Slider(value: $colorTemperature)
                    } //: VStack
                    .padding(.vertical)
                } header: {
                    Text("COLOR TEMPERATURE")
                        .padding(.top)
                }
            } //: Form
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  AppStorageCustomObject.swift
//  New in SwiftUI
//
//  Created by Kim Yewon on 2022/09/29.
//

import SwiftUI


struct Settings: Codable {
    let darkMode: Bool
    let name: String
}

struct AppStorageCustomObjectView: View {
    
    @AppStorage("Settings")
    private var settingsData: Data = Data()
    
    @State private var output: String = ""
    
    var body: some View {
        VStack {
            Text(output)
    
            Button {
                guard let settings = try? JSONDecoder().decode(Settings.self, from: settingsData) else { return }
                
                output = "isDarkMode: \(settings.darkMode), name: \(settings.name)"
            } label: {
                Text("Load from App Storage")
            }
            
            Button {
                
                let settings = Settings(darkMode: true, name: "Newon")
                guard let settingsData = try? JSONEncoder().encode(settings) else {
                    return
                }
                self.settingsData = settingsData
                
            } label: {
                Text("Save in App Storage")
            }
        }

    }
}

struct AppStorageCustomObject_Previews: PreviewProvider {
    static var previews: some View {
        AppStorageCustomObjectView()
    }
}

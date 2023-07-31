//
//  AppStorage.swift
//  New in SwiftUI
//
//  Created by Kim Yewon on 2022/09/29.
//

import SwiftUI

struct AppStorageView: View {
    
    @AppStorage("isDarkMode")
    private var isDarkMode: Bool = false
    
    var body: some View {
        VStack {
            Text(isDarkMode ? "DARK" : "LIGHT")
            Toggle("Select Mode", isOn: $isDarkMode)
                .fixedSize()
        }
    }
}

struct AppStorage_Previews: PreviewProvider {
    static var previews: some View {
        AppStorageView()
    }
}

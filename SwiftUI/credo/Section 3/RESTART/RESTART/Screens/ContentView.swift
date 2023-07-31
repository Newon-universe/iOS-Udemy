//
//  ContentView.swift
//  RESTART
//
//  Created by Kim Yewon on 2022/09/01.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = true
    // AppStorage is a special SwiftUI Property wrapper that will use the user's defaults under the hood
    // It's purpose is to store some value on the device's permanent storage by utilizing a gettubg set method.
    // AppStorage Parameter is unique identifier that we can refer to later on by using this key. we can edit or recall it saved value on the device storage.
    // var is the actual property name that we can use in this SwiftUI file.
    
    
    var body: some View {
        ZStack {
            if isOnboardingViewActive {
                OnboardingView()
            } else {
                HomeView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

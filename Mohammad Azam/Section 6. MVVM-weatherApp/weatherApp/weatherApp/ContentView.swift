//
//  ContentView.swift
//  weatherApp
//
//  Created by Kim Yewon on 2022/09/23.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var weatherVM: WeatherViewModel = WeatherViewModel()
    
    var body: some View {
        VStack(alignment: .center) {
            
            TextField("Enter the city", text: self.$weatherVM.cityName) {
                self.weatherVM.search()
            }
            .font(.custom("Arial", size: 50))
            .padding()
            .fixedSize()
            
            Text(self.weatherVM.temperature)
                .font(.custom("Arial", size: 100))
                .foregroundColor(.white)
                .offset(y: -100)
                .padding()
            
        }
        .frame(minWidth: 0, maxWidth: .infinity,
               minHeight: 0,maxHeight: .infinity)
        .background(Color.green)
        .edgesIgnoringSafeArea(.all)
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

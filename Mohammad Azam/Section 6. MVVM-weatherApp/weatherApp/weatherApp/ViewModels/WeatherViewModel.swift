//
//  WeatherViewModel.swift
//  weatherApp
//
//  Created by Kim Yewon on 2022/09/23.
//

import Foundation
import Combine

class WeatherViewModel: ObservableObject {
    
    private var weatherServices: WeatherService
    @Published var weather = Weather(temp: nil, humidity: nil)
    
    init() {
        self.weatherServices = WeatherService()
    }
    
    var temperature: String {
        if let temp = self.weather.temp {
            return String(format: "%.0f", temp)
        } else {
            return ""
        }
    }
    
    var humidity: String {
        if let humidity = self.weather.humidity {
            return String(format: "%0.f", humidity)
        } else {
            return ""
        }
    }
    
    @Published var cityName: String = ""
    
    func search() {
        if let city = self.cityName.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) {
            fetchWeather(by: city)
        }
    }
    
    private func fetchWeather(by city: String) {
        self.weatherServices.getWeather(city: city) { weather in

            if let weather = weather {
                print(weather)

                DispatchQueue.main.async {
                    self.weather = weather
                }
            }
            
        }
    }
    
}

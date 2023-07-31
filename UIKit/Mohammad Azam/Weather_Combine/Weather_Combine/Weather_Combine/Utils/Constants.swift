//
//  Constants.swift
//  Weather_Combine
//
//  Created by Kim Yewon on 2023/07/25.
//

import Foundation

struct Constants {
    struct URLs {
        static func weather(city: String) -> String {
            return "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=ea19a6872a1856598051300b953de50e&units=metric"
        }
    }
}

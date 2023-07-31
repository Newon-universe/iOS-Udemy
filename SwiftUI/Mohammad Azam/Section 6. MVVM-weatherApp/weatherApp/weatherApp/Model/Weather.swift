//
//  Weather.swift
//  weatherApp
//
//  Created by Kim Yewon on 2022/09/23.
//

import Foundation

struct WeatherResponse: Decodable {
    let main: Weather
}

struct Weather: Decodable {
    let temp: Double?
    let humidity: Double?

//    private enum CodingKeys: String, CodingKey {
//        case temp = "temperature"
//        case humidity
//    }
}

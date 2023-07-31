//
//  WebService.swift
//  Weather_Combine
//
//  Created by Kim Yewon on 2023/07/25.
//

import Foundation
import Combine

class WebService {
    func fetchWeather(city: String) -> AnyPublisher<Weather, Error> {
        guard let url = URL(string: Constants.URLs.weather(city: city)) else { fatalError("Invalid URL") }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: WeatherResponse.self, decoder: JSONDecoder())
            .map { $0.main }
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
}

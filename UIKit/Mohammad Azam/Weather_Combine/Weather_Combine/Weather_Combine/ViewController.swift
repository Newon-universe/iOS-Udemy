//
//  ViewController.swift
//  Weather_Combine
//
//  Created by Kim Yewon on 2023/07/25.
//

import UIKit
import Combine

class ViewController: UIViewController {

    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityTextField: UITextField!
    
    private var webservice: WebService = WebService()
    private var cancellabel: AnyCancellable?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupPublishers()
        
//        self.cancellabel = self.webservice.fetchWeather(city: "Seoul")
//            .catch { _ in Just(Weather.placeholder) }
//            .map { weather in
//                if let temp = weather.temp { return "\(temp)℃" }
//                else { return "Error getting weather" }
//            }
//            .assign(to: \.text, on: self.temperatureLabel) // assign to means the value from on, not a value from everywhere.
    }
    
    private func setupPublishers() {
        let publisher = NotificationCenter.default.publisher(for: UITextField.textDidChangeNotification, object: self.cityTextField)
        
        self.cancellabel = publisher
            .compactMap { ($0.object as! UITextField).text?.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) }
            .debounce(for: .milliseconds(500), scheduler: RunLoop.main)
            .flatMap { city in
                return self.webservice.fetchWeather(city: city)
                    .catch { _ in Just(Weather.placeholder) }
                    .map { $0 }
            }
            .sink {
                if let temp = $0.temp {
                    self.temperatureLabel.text = "\(temp)℃"
                } else {
                    self.temperatureLabel.text = "Can't find the city"
                }
                
            }
    }
    
}


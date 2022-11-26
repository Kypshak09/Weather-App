//
//  weatherManager.swift
//  Weather
//
//  Created by Amir Zhunussov on 22.11.2022.
//

import Foundation

struct WeatherManager {
    let weatherUrl = "https://api.openweathermap.org/data/2.5/weather?appid=15ac080828d51ba67eb7eddb9f3878c2&units=metric"
    
    func findCity(cityName: String) {
        let urlString = "\(weatherUrl)&q=\(cityName)"
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String) {
        if let url = URL(string: urlString) {
            let urlSession = URLSession(configuration: .default)
            let task = urlSession.dataTask(with: url) {data, response, error in
                if error != nil {
                    print(error!)
                }
            }
            task.resume()
        }
    }
    
    
}

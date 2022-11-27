//
//  weatherManager.swift
//  Weather
//
//  Created by Amir Zhunussov on 22.11.2022.
//

import Foundation

protocol WeatherManagerDelegate {
    func didUpdateWeather( _ weatherManager: WeatherManager, weather: WeatherModel)
}


struct WeatherManager {
    let weatherUrl = "https://api.openweathermap.org/data/2.5/weather?appid=15ac080828d51ba67eb7eddb9f3878c2&units=metric"
    
    var delegate: WeatherManagerDelegate?
    
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
                if let safeData = data {
                    if let weather = self.paseJSON(safeData) {
                        self.delegate?.didUpdateWeather(self, weather: weather)
                    }
                }
            }
            task.resume()
        }
    }
    
    func paseJSON(_ weatherData: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let name = decodedData.name
            let main = decodedData.weather[0].description
            let weather = WeatherModel(conditionId: id, cityName: name, temperature: temp, main: main)
            return weather
        } catch {
            return nil
        }
        }
    }
    


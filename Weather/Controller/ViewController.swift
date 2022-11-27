//
//  ViewController.swift
//  Weather
//
//  Created by Amir Zhunussov on 16.11.2022.
//

import UIKit

class ViewController: UIViewController, UISearchTextFieldDelegate, WeatherManagerDelegate {
    func didFailError(error: Error) {
        print(error)
    }
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var labelImageWeather: UILabel!
    @IBOutlet weak var imageWeather: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var gifImage: UIImageView!
    
    var weatherManager = WeatherManager()
    var currentDate = CurrentDate()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchTextField.delegate = self
        weatherManager.delegate = self
        
        
        let cityGif = UIImage.gifImageWithName("night")
        gifImage.image = cityGif
        dateLabel.text = currentDate.date
       
    }

   
    
    @IBAction func chooseClothButton(_ sender: UIButton) {
        self.performSegue(withIdentifier: "goToCloth", sender: self)
    }
    
    
    @IBAction func searchButton(_ sender: UIButton) {
        weatherManager.findCity(cityName: searchTextField.text!)
        searchTextField.endEditing(true)
        print(weatherManager.weatherUrl)
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.endEditing(true)
        return true
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        if textField.text != " " {
            return true
        }
        else {
            searchTextField.placeholder = "Please type your city"
            return false
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let city = searchTextField.text {
            weatherManager.findCity(cityName: city)
        }
        searchTextField.text = ""
    }
    
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel) {
        DispatchQueue.main.async {
            self.temperatureLabel.text = weather.temperatureString
            self.cityLabel.text = weather.cityName
            self.imageWeather.image = UIImage(systemName: weather.conditionName)
            self.labelImageWeather.text = weather.main
        }
    }
}


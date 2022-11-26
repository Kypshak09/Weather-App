//
//  ViewController.swift
//  Weather
//
//  Created by Amir Zhunussov on 16.11.2022.
//

import UIKit

class ViewController: UIViewController, UISearchTextFieldDelegate {

    
    var weatherManager = WeatherManager()
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var labelImageWeather: UILabel!
    @IBOutlet weak var imageWeather: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var gifImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchTextField.delegate = self
        
        
        let cityGif = UIImage.gifImageWithName("night")
        gifImage.image = cityGif
       
    }

   
    
    @IBAction func searchButton(_ sender: UIButton) {
        weatherManager.findCity(cityName: searchTextField.text!)
        
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
    
}


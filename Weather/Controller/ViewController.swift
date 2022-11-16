//
//  ViewController.swift
//  Weather
//
//  Created by Amir Zhunussov on 16.11.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var gifImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let cityGif = UIImage.gifImageWithName("city.night")
        gifImage.image = cityGif
       
    }


}


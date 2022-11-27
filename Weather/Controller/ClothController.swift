//
//  ClothController.swift
//  Weather
//
//  Created by Amir Zhunussov on 27.11.2022.
//

import Foundation
import UIKit

class ClothController: UIViewController {
    
    
    @IBOutlet weak var clothLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func backToCityButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
    


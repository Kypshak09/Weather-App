//
//  currentDate.swift
//  Weather
//
//  Created by Amir Zhunussov on 27.11.2022.
//

import Foundation

struct CurrentDate {
    let date = Date().formatted(date: .long, time: .omitted)
}

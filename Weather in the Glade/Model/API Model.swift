//
//  API Model.swift
//  Weather in the Glade
//
//  Created by Леонид Лукашевич on 16.09.2022.
//

import Foundation

struct APIModel {
    private static let lattitude: String = "43.679971"
    private static let longitude: String = "40.205547"
    private static let apiKey: String = "c3b6535a0dc694e01ca7487631eed48b"
    private static let language = "ru"
    private static let units = "metric"
    
    static let url: String = "https://api.openweathermap.org/data/2.5/weather?lat=\(lattitude)&lon=\(longitude)&appid=\(apiKey)&lang=\(language)&units=\(units)"
}

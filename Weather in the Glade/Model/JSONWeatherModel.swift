//
//  JSONWeatherModel.swift
//  Weather in the Glade
//
//  Created by Леонид Лукашевич on 16.09.2022.
//

import UIKit

struct JSONWeatherModel: Decodable {
    
    let clouds: Clouds
    let main: Main
    let name: String
    let visibility: Int
    let weather: [Weather]
    let wind: Wind
    
//    init?(json: [String: Any]) {
//        let clouds = json["clouds"] as? Clouds
//        let main = json["main"] as? Main
//        let name = json["name"] as? String
//        let visibility = json["visibility"] as? String
//        let weather = json["weather"] as? Weather
//        let wind = json["wind"] as? Wind
//
//        self.clouds = clouds
//        self.main = main
//        self.name = name
//        self.visibility = visibility
//        self.weather = weather
//        self.wind = wind
//    }
}

struct Wind: Decodable {
    let deg: Int
    let speed: Float
}

struct Weather: Decodable {
    let description: String
    let icon: String
}

struct Main: Decodable {
    let feels_like: Float
    let humidity: Int
    let pressure: Int
    let temp: Float
}

struct Clouds: Decodable {
    let all: Int
}

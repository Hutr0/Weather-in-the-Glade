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
}

struct WeatherModel {
    let nameLabel: String
    let weatherDescription: String
    let tempLabel: String
    var weatherImage: String
    let feelsLikeLabel: String
    let cloudyLabel: String
    let visibilityLabel: String
    let windLabel: String
    let pressureLabel: String
    let humidityLabel: String
    
    init(from json: JSONWeatherModel) {
        self.nameLabel = json.name
        self.weatherDescription = json.weather[0].description.prefix(1).uppercased() + json.weather[0].description.dropFirst()
        self.weatherImage = json.weather[0].icon
        self.tempLabel = String(Int(json.main.temp)).uppercased()
        self.feelsLikeLabel = "Ощущается как \(Int(json.main.feels_like))"
        self.cloudyLabel = "Облачность: \(json.main.humidity)%"
        
        if json.visibility >= 1000 {
            self.visibilityLabel = "Видимость: \(json.visibility / 1000) км"
        } else {
            self.visibilityLabel = "Видимость: \(json.visibility) метров"
        }
        
        let d = Double(json.wind.deg)
        var value = ""
        if d >= 0 && d < 22.5 {
            value = "С"
        } else if d >= 22.5 && d < 45 {
            value = "СВ"
        } else if d >= 45 && d < 67.5 {
            value = "СВ"
        } else if d >= 67.5 && d < 90 {
            value = "В"
        } else if d >= 90 && d < 112.5 {
            value = "В"
        } else if d >= 112.5 && d < 135 {
            value = "ЮВ"
        } else if d >= 135 && d < 157.5 {
            value = "ЮВ"
        } else if d >= 157.5 && d < 180 {
            value = "Ю"
        } else if d >= 180 && d < 202.5 {
            value = "Ю"
        } else if d >= 202.5 && d < 225 {
            value = "ЮЗ"
        } else if d >= 225 && d < 247.5 {
            value = "ЮЗ"
        } else if d >= 247.5 && d < 270 {
            value = "З"
        } else if d >= 270 && d < 292.5 {
            value = "З"
        } else if d >= 292.5 && d < 315 {
            value = "СЗ"
        } else if d >= 315 && d < 337.5 {
            value = "СЗ"
        } else if d >= 337.5 && d < 360 {
            value = "С"
        }
            
        self.windLabel = "Ветер: \(json.wind.speed) м/c '\(value)'"
        self.pressureLabel = "Давление: \(json.main.pressure) мм рт. ст."
        self.humidityLabel = "Валжность: \(json.main.humidity)%"
    }
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

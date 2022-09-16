//
//  ViewController.swift
//  Weather in the Glade
//
//  Created by Леонид Лукашевич on 16.09.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var stackView: UIStackView!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var weatherDescription: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var feelsLikeLabel: UILabel!
    
    @IBOutlet weak var cloudyLabel: UILabel!
    @IBOutlet weak var visibilityLabel: UILabel!
    @IBOutlet weak var windLabel: UILabel!
    @IBOutlet weak var pressureLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    
    
    let vcm = ViewControllerManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        stackView.layer.cornerRadius = stackView.layer.bounds.width / 24
        
        vcm.startTrackingWeather { json in
            DispatchQueue.main.async {
                self.nameLabel.text = json.name
                self.weatherDescription.text = json.weather[0].description.prefix(1).uppercased() + json.weather[0].description.dropFirst()
                GetDataManager.getImage(url: "https://openweathermap.org/img/w/\(json.weather[0].icon).png") { img in
                    self.weatherImage.image = img
                }
                self.tempLabel.text = String(Int(json.main.temp)).uppercased()
                self.feelsLikeLabel.text = "Ощущается как \(Int(json.main.feels_like))"
                self.cloudyLabel.text = "Облачность: \(json.main.humidity)%"
                
                if json.visibility >= 1000 {
                    self.visibilityLabel.text = "Видимость: \(json.visibility / 1000) км"
                } else {
                    self.visibilityLabel.text = "Видимость: \(json.visibility) метров"
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
                    
                self.windLabel.text = "Ветер: \(json.wind.speed) м/c '\(value)'"
                self.pressureLabel.text = "Давление: \(json.main.pressure) мм рт. ст."
                self.humidityLabel.text = "Валжность: \(json.main.humidity)%"
            }
        }
    }
}


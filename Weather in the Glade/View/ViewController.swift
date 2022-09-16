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
                
                let weather = WeatherModel(from: json)
                
                GetDataManager.getImage(url: "https://openweathermap.org/img/w/\(weather.weatherImage).png") { img in
                    self.weatherImage.image = img
                }
                
                self.nameLabel.text = weather.nameLabel
                self.weatherDescription.text = weather.weatherDescription
                self.tempLabel.text = weather.tempLabel
                self.feelsLikeLabel.text = weather.feelsLikeLabel
                self.cloudyLabel.text = weather.cloudyLabel
                self.visibilityLabel.text = weather.visibilityLabel
                self.windLabel.text = weather.windLabel
                self.humidityLabel.text = weather.humidityLabel
            }
        }
    }
}


//
//  ViewControllerManager.swift
//  Weather in the Glade
//
//  Created by Леонид Лукашевич on 16.09.2022.
//

import UIKit

class ViewControllerManager {
    
    private let timer = TimerManager.shared
    
    func startTrackingWeather(closure: @escaping (JSONWeatherModel) -> ()) {
        
        GetDataManager.getRequest(url: APIModel.url) { json in
            closure(json)
        }
        
        timer.start {
            GetDataManager.getRequest(url: APIModel.url) { json in
                closure(json)
            }
        }
    }
}

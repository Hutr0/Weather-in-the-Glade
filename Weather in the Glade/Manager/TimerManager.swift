//
//  TimerManager.swift
//  Weather in the Glade
//
//  Created by Леонид Лукашевич on 16.09.2022.
//

import Foundation

class TimerManager {
    
    static let shared = TimerManager()
    private init() {}
    
    var timer = Timer()
    
    func start(timeInterval: Double = 60, closure: @escaping () -> ()) {
        timer.invalidate()
        
        timer = Timer.scheduledTimer(withTimeInterval: timeInterval, repeats: true, block: { _ in
            closure()
        })
    }
    
    func stop() {
        timer.invalidate()
    }
}

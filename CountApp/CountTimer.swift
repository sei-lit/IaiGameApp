//
//  Timer.swift
//  CountApp
//
//  Created by 大森青 on 2023/05/02.
//

import Foundation

class CountTimer {
    var myTimer: Timer!
    
    @objc private func interval_func() {
        print("interval_func")
    }
    
    init(timeInterval: Double) {
        myTimer = Timer.scheduledTimer(timeInterval: timeInterval,
                                       target: self,
                                       selector: #selector(self.interval_func),
                                       userInfo: nil,
                                       repeats: true)
    }
}

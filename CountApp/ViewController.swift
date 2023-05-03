//
//  ViewController.swift
//  CountApp
//
//  Created by 大森青 on 2023/05/02.
//

import UIKit

class ViewController: UIViewController {
    
    var delay: Double = 0
    var result: Double = 0
    var countdownNumber: Double = 5
    var timeInterval: Double = 0.00
    var countTimer = Timer()
    var recordTimer = Timer()
    
    @IBOutlet var countdownLabel: UILabel!
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var startButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        countdownLabel.isHidden = true
        resultLabel.isHidden = true
        countdownLabel.text = String(Int(countdownNumber))
        delay = Double.random(in: 1.00...5.00)
        
    }
    
    @IBAction func start() {
        countdownLabel.isHidden = false
        startButton.isHidden = true
        
        setTimer(timeInterval: 1, up: false)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.countdownLabel.isHidden = true
            self.setTimer(timeInterval: 0.01, up: false)
            
            self.makeDelay()
        }
        
        
    }
    
    @IBAction func shoot() {
        stopTimer(timer: countTimer)
        resultLabel.isHidden = false
        resultLabel.text = String(format: "%.3f", result)
    }
    
    @objc func countdown() {
        if countdownNumber <= 1 {
            stopTimer(timer: countTimer)
            
        } else {
            countdownNumber -= timeInterval
            countdownLabel.text = String(Int(countdownNumber))
        }
    }
    
    @objc func countup() {
        result += timeInterval
    }
    
    func makeDelay() {
        DispatchQueue.main.asyncAfter(deadline: .now() + self.delay) { 
            self.countdownLabel.isHidden = false
            self.countdownLabel.text = String("撃て")
            self.setTimer(timeInterval: 0.01, up: true)

        }
    }
    
    
    func setTimer(timeInterval: Double, up: Bool) {
        self.timeInterval = timeInterval
        if !up {
            countTimer = Timer.scheduledTimer(
                timeInterval: timeInterval,
                target: self,
                selector: #selector(countdown),
                userInfo: nil,
                repeats: true
            )
        } else {
            countTimer = Timer.scheduledTimer(
                timeInterval: timeInterval,
                target: self,
                selector: #selector(countup),
                userInfo: nil,
                repeats: true
            )
        }
    }
    
    func stopTimer(timer: Timer) {
        if timer.isValid {
            timer.invalidate()
        }
    }
}


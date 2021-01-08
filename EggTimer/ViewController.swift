//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let eggTime = ["Soft":3, "Medium":4, "Hard":5]
    
    var isRunning = false
    
    var timer:Timer!
    var count:Int = 0
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        count = eggTime[sender.currentTitle!]!
        if isRunning == true {
        timer.invalidate()
        }
        
        titleLabel.text="Starting countdown"
        isRunning = true
        startTimer()
    
    }
    
    func startTimer(){
        timer = Timer.scheduledTimer(timeInterval: 1.0, target:self, selector: #selector(updateTime),
            userInfo: nil,
            repeats: true
            )
    }
    
    @IBOutlet weak var titleLabel: UILabel!
    @objc func updateTime(){
        print("\(count) seconds")

        if count > 0 {
            count -= 1
        } else {
            timer.invalidate()
            
            titleLabel.text="Done"
        }
        
    }
}

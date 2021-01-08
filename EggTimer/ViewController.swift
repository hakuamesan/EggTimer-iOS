//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let eggTime = ["Soft":5, "Medium":7, "Hard":12]
    
    var timer:Timer!
    var count = 60
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        //print(eggTime[sender.currentTitle!])
     
        startTimer()
        
    
    }
    
    func startTimer(){
        timer = Timer.scheduledTimer(timeInterval: 1.0, target:self, selector: #selector(updateTime),
            userInfo: nil,
            repeats: true
            )
    }
    
    @objc func updateTime(){
        print("\(count) seconds")

        if count != 0 {
            count -= 1
        } else {
            timer.invalidate()
        }
        
    }
}

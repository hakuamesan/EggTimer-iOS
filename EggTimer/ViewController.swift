//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    var player: AVAudioPlayer!

    let eggTime = ["Soft":3, "Medium":4, "Hard":5]
    
    var isRunning = false
    
    var timer:Timer!
    var count:Int = 0
    var totalTime:Int = 0
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        totalTime = eggTime[sender.currentTitle!]!
        count = 0
        
        if isRunning == true {
        timer.invalidate()
        }
        
        titleLabel.text=sender.currentTitle
        isRunning = true
        startTimer()
    
        pbTimer.progress = 0.0
        
    }
    
    func startTimer(){
        timer = Timer.scheduledTimer(timeInterval: 1.0, target:self, selector: #selector(updateTime),
            userInfo: nil,
            repeats: true
            )
    }
    
    @IBOutlet weak var pbTimer: UIProgressView!
    @IBOutlet weak var titleLabel: UILabel!
    
    
    @objc func updateTime(){
        print("\(count) seconds")

        if count < totalTime {
            count += 1
            
            pbTimer.progress = Float(count)/Float(totalTime)
            
            
        } else {
            timer.invalidate()
            playSound()
            titleLabel.text="Done"
        }
        
    }
    
    func playSound() {
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
                
    }
}

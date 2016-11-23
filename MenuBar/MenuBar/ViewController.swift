//
//  ViewController.swift
//  MenuBar
//
//  Created by Hugo Landim Santos on 09/11/16.
//  Copyright © 2016 Hugo Landim Santos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let startTimerSec = 210
    var timerSec : Int = 0
    @IBOutlet var timerLabel: UILabel!
    
    
    var timer = Timer()

    @IBAction func pauseClicked(_ sender: Any) {
        timer.invalidate()
    }
    
    @IBAction func playClicked(_ sender: Any) {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.processTimer), userInfo: nil , repeats: true)
    }
    
    @IBAction func decrementClicked(_ sender: Any) {
        timerSec -= 10
        if timerSec < 0 {
            timerSec = 0
        }
        timerLabel.text = String(timerSec)
    }
    
    @IBAction func incrementTimer(_ sender: Any) {
        timerSec += 10
        timerLabel.text = String(timerSec)
    }
    
    
    @IBAction func resetCliked(_ sender: Any) {
        timerSec = startTimerSec
        timerLabel.text = String(timerSec)
    }
    
    
    func processTimer(){
    
        if timerSec > 0 {
            //Processa timer
            timerSec -= 1
            timerLabel.text = String(timerSec)
        } else {
            pauseClicked(Any.self)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timerLabel.text = String(startTimerSec)
        timerSec = startTimerSec
        
        playClicked(Any.self)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


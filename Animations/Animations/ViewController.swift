//
//  ViewController.swift
//  Animations
//
//  Created by Hugo Landim Santos on 17/11/16.
//  Copyright © 2016 Hugo Landim Santos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let totalGifFrames = 19;
    var actualGriFrame:Int = 0;
    var isAnimating = false
    var timer = Timer()
    
    @IBAction func fadeIn(_ sender: Any) {
        gitImageView.alpha = 0
        UIView.animate(withDuration: 1, animations: {
            self.gitImageView.alpha = 1
        })
    }
    
    @IBAction func slideIn(_ sender: Any) {
    
        gitImageView.center = CGPoint(x: gitImageView.center.x - 500, y: gitImageView.center .y)
        
        UIView.animate(withDuration: 1, animations: {
            self.gitImageView.center = CGPoint(x: self.gitImageView.center.x + 500, y: self.gitImageView.center .y)
        })
    }
    @IBAction func grow(_ sender: Any) {
        let originalWidth = gitImageView.frame.size.width
        let originalHeight = gitImageView.frame.size.height
        gitImageView.frame = CGRect(x: gitImageView.frame.origin.x
            , y: gitImageView.frame.origin.y, width: 0, height: 0)
        
        UIView.animate(withDuration: 1, animations: {
            self.gitImageView.frame = CGRect(x: self.gitImageView.frame.origin.x
                , y: self.gitImageView.frame.origin.y, width: originalWidth, height: originalHeight)
        })
    }
    @IBOutlet var gitImageView: UIImageView!
    
    @IBOutlet var startStopButton: UIButton!
    @IBAction func next(_ sender: Any) {
        if isAnimating {
            timer.invalidate()
            startStopButton.setTitle("Start", for: UIControlState.normal)
        } else {
            timer = Timer.scheduledTimer(timeInterval: 0.015, target: self, selector: #selector(ViewController.changeFrame), userInfo: nil, repeats: true)
            startStopButton.setTitle("Stop", for: UIControlState.normal)
        }
        
        isAnimating = !isAnimating
    }
    
    func changeFrame() {
        actualGriFrame += 1
        if(actualGriFrame > 19) {
            actualGriFrame = 0
        }
        gitImageView.image = UIImage(named: "frame_\(actualGriFrame)_delay-0.03s.gif")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        actualGriFrame = 0
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


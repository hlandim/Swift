//
//  ViewController.swift
//  HowManyFingers
//
//  Created by Hugo Landim Santos on 07/11/16.
//  Copyright © 2016 Hugo Landim Santos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var responseLabel: UILabel!
    @IBOutlet var guessField: UITextField!
    
    @IBAction func submitClicked(_ sender: Any) {
        if(guessField.text != "") {
            let guess = UInt32(guessField.text!)
            let random = arc4random_uniform(6)
            if(guess == random){
                responseLabel.text = "That`s right!"
            } else {
                responseLabel.text = "Wrong, It was a \(random)"
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


//
//  ViewController.swift
//  IsItPrime
//
//  Created by Hugo Landim Santos on 07/11/16.
//  Copyright © 2016 Hugo Landim Santos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var numberField: UITextField!
    
    @IBOutlet var msgLabel: UILabel!
    
    @IBAction func checkPrimeClicked(_ sender: Any) {
        let number = numberField.text
        
        if number != "" {
            let intNumber = Int(number!)
            if isPrime(number: intNumber!) {
                msgLabel.text = "\(intNumber!) is prime!"
            } else {
                msgLabel.text = "\(intNumber!) is not prime!"
            }
        }
    }
    
    func isPrime( number : Int) -> Bool {
        if number == 1 {
            return false
        }
        
        var i = 2
        
        while i < number {
        
            if number % i == 0 {
              return false
            }
            i += 1
        }
        return true
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


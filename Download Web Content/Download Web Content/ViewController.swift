//
//  ViewController.swift
//  Download Web Content
//
//  Created by Hugo Landim Santos on 13/11/16.
//  Copyright © 2016 Hugo Landim Santos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var webview: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let url = URL(string:"https://stackoverflow.com/") {
//            webview.loadRequest(URLRequest(url: url))
            let request = NSMutableURLRequest(url: url)
            
            let task = URLSession.shared.dataTask(with: request as URLRequest) {
                data, response, error in
                
                if error != nil {
                    print(error ?? "No error returned")
                } else {
                    if let unwrappedData = data {
                        let dataString = NSString(data: unwrappedData, encoding: String.Encoding.utf8.rawValue)
                        print(dataString ?? "No data returned")
                        
                        DispatchQueue.main.sync(execute: { 
                            //Update UI
                        })
                    }
                }
            }
            task.resume()
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}


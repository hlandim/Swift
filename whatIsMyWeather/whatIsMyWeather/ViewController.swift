//
//  ViewController.swift
//  whatIsMyWeather
//
//  Created by Hugo Landim Santos on 14/11/16.
//  Copyright © 2016 Hugo Landim Santos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let serviceUrl = "http://www.weather-forecast.com"

    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var cityField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func sibmitPressed(_ sender: Any) {
        let city = cityField.text
        if city != "" {
            getUrlString(city: city!)
        }
    }
    
    func getUrlString(city:String){
        let task = URLSession.shared.dataTask(with: mountUrlRequest(city: city)){
            data, response, error in
            if(error != nil) {
                print(error ?? "Error without message")
            } else {
                if let unwrappedData = data {
                    let dataString = NSString(data: unwrappedData, encoding: String.Encoding.utf8.rawValue)!
                    var stringSeparator = "Weather Forecast Summary:</b><span class=\"read-more-small\"><span class=\"read-more-content\"> <span class=\"phrase\">"
                    let contentArray = dataString.components(separatedBy: stringSeparator)
                
                       stringSeparator = "</span>"
                        let newContentArray = contentArray[1].components(separatedBy: stringSeparator)
                        
                        if newContentArray.count > 0{
                            let finalResult = newContentArray[0].replacingOccurrences(of: "&deg;", with: "°")
                            
                            DispatchQueue.main.sync {
                                self.resultLabel.text = finalResult
                            }
                    }
//                    let startString = NSString(string: "<span class=\"phrase\">")
//                    let endString = NSString(string: "</span></span></span></p>")
//                    let range = dataString.range(of: ((startString as String) + "(.*?)" + (endString as String)), options: .regularExpression)
//                    if range.length > 0 {
//                        let tempString = NSString(string:dataString.substring(with: range))
//                        let result = NSString(string:tempString.substring(from: startString.length))
//                        
//                        let finalResult = result.substring(to: (result.length - endString.length))
//                    
//                        DispatchQueue.main.sync {
//                            self.resultLabel.text = finalResult
//                        }
//                        
//                        
//                    }
                }
            }
        }
        
        self.resultLabel.text = ""
        task.resume()
    }
    
    func mountUrlRequest(city:String) -> URL{
        let cityTrimmed = city.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        let stringUrl = serviceUrl + "/locations/" + cityTrimmed.replacingOccurrences(of: " ", with: "-") + "/forecasts/latest"
        let url = URL(string: stringUrl)
        print("final Url: \(url)")
        return url!
    }


}


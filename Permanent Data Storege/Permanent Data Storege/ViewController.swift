//
//  ViewController.swift
//  Permanent Data Storege
//
//  Created by Hugo Landim Santos on 11/11/16.
//  Copyright © 2016 Hugo Landim Santos. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var phoneField: UITextField!
    @IBOutlet var phonesTable: UITableView!
    var arrayNumbers = [String]()
    let userDefaultKey = "arrayNumbers"
    
    @available(iOS 2.0, *)
    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayNumbers.count
        
    }
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "row")
        
        cell.textLabel?.text = String(describing: arrayNumbers[indexPath.row])
        
        return cell
    
    }
    
    @IBAction func addClicked(_ sender: Any) {
        
        let phone = phoneField.text
        if(phone != ""){
            arrayNumbers.append(phone!)
            UserDefaults.standard.set(arrayNumbers, forKey: userDefaultKey)
            phonesTable.reloadData()
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let arrayObject = UserDefaults.standard.object(forKey: userDefaultKey)
        
        if let array = arrayObject as? [String]{
            arrayNumbers = array
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


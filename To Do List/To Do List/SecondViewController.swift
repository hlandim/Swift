//
//  SecondViewController.swift
//  To Do List
//
//  Created by Hugo Landim Santos on 13/11/16.
//  Copyright © 2016 Hugo Landim Santos. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var toDoItemField: UITextField!
    @IBOutlet var messageLabel: UILabel!
    
    @IBAction func saveClicked(_ sender: Any) {
        let toDo = toDoItemField.text
        if toDo != "" {
            UtilUserDefaults.addItemToDoList(item: toDo!)
            toDoItemField.text = ""
            messageLabel.text = "Item adicionado com sucesso!"
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
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }


}


//
//  FirstViewController.swift
//  To Do List
//
//  Created by Hugo Landim Santos on 13/11/16.
//  Copyright © 2016 Hugo Landim Santos. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDataSource, UITextFieldDelegate {
    var toDoList = [String]()
    
    var indexToDelete: IndexPath? = nil
    @IBOutlet var toDoTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        refresTable()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        refresTable()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoList.count
    }
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "toDoCell")
        cell.textLabel?.text = toDoList[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let toDo = toDoList[indexPath.row]
            confirmDelete(toDo: toDo, index: indexPath)
        }
    }
    
    func confirmDelete(toDo : String, index: IndexPath) {
            indexToDelete = index
            let alert = UIAlertController(title: "Delete to do", message: "Are you sure you want delete \(toDo)?", preferredStyle: .actionSheet)
        
            let deletAction = UIAlertAction(title: "Delete", style: .destructive, handler: handleConfirmDeleteToDo)
        
            let cancelAtion = UIAlertAction(title: "cancel", style: .cancel, handler: handleCancelDelteToDo)
        
            alert.addAction(deletAction)
            alert.addAction(cancelAtion)
        
            self.present(alert, animated: true, completion: nil)
    }
    
    
    func handleCancelDelteToDo(alertAction: UIAlertAction!) -> Void {
        indexToDelete = nil
    }
    
    func handleConfirmDeleteToDo(alertAction: UIAlertAction!) -> Void {
        if indexToDelete != nil {
            toDoTableView.beginUpdates()
            UtilUserDefaults.deleteItemToDoList(index: (indexToDelete?.row)!)
            toDoTableView.deleteRows(at: [indexToDelete!], with: .automatic)
            indexToDelete = nil
            toDoList = UtilUserDefaults.getToDolist()
            toDoTableView.endUpdates()
        }
    
    }
    
    func refresTable(){
        toDoList = UtilUserDefaults.getToDolist()
        toDoTableView.reloadData()
        
    }

}


//
//  UtilUserDefaults.swift
//  To Do List
//
//  Created by Hugo Landim Santos on 13/11/16.
//  Copyright © 2016 Hugo Landim Santos. All rights reserved.
//

import UIKit

class UtilUserDefaults {
    
    static let arrayKey = "toDoListArrayKey"
    
    static func getToDolist() -> [String] {
        let arrayObject = UserDefaults.standard.array(forKey: arrayKey)
        
        if let array = arrayObject as? [String] {
            return array
        }
        return [String]()
    }
    
    static func addItemToDoList(item: String) {
        var array = getToDolist()
        array.append(item)
        saveToDoList(list: array)
    }
    
    static func saveToDoList(list: [String]){
        UserDefaults.standard.set(list, forKey: arrayKey)
    }
    
    static func deleteItemToDoList(index: Int) {
        var array = getToDolist()
        if index < array.count && index > -1 {
            array.remove(at: index)
            saveToDoList(list: array)
        }
    }

}

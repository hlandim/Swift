//: Playground - noun: a place where people can play

import UIKit
/*
var str = "Hello"

var newString = str + ", Hugo!"
//
//for character in newString.characters {
//    print(character)
//}

var newTypeString = NSString(string: newString)

newTypeString.substring(to: 5)

newTypeString.substring(from: 4)

var newStrString = NSString(string: str)
NSString(string: newTypeString.substring(from: newStrString.length + 2)).substring(to: 4)

newTypeString.substring(with: NSRange(location: (newStrString.length + 2), length: 4))

if (newString.contains("Hugo")) {
    print("the string '\(newString)' contains Hugo")
}
*/

let urlString = NSString(string: "<span class=\"phrase\">Light rain (total 3mm), mostly falling on Fri morning. Warm (max 23&deg;C on Sun morning, min 11&deg;C on Sat night). Winds decreasing (fresh winds from the SSE on Fri morning, calm by Sun morning).</span></span></span></p>")
let startString = NSString(string: "<span class=\"phrase\">")
let endString = NSString(string: "</span></span></span></p>")
var range = urlString.range(of: "<span class=\"phrase\">(.*?)</span></span></span></p>", options: .regularExpression)
if range.length > 0 {
    var tempString = NSString(string:urlString.substring(with: range))
    let result = NSString(string:tempString.substring(from: startString.length))
    
    print(result.substring(to: (result.length - endString.length)))

}


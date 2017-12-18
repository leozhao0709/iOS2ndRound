//: Playground - noun: a place where people can play

import UIKit

@objcMembers
class Person: NSObject {
    var name: String?
    var age: Int = 0

    init(dict: [String: Any]) {
        super.init()
        setValuesForKeys(dict)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
}

let dict:[String: Any] = ["name" : "why", "age" : 18, "height": "188cm"]
let p = Person(dict: dict)
print(p.age)
print(p.name!)


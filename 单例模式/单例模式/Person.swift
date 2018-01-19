//
//  Person.swift
//  单例模式
//
//  Created by Lei Zhao on 1/19/18.
//  Copyright © 2018 Lei Zhao. All rights reserved.
//

import UIKit

class Person: NSObject {
    static var sharedPerson: Person = {
        let person = Person()
        return person
    }()
    
    private override init() {
    }
}

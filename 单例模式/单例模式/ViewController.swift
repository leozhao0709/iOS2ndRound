//
//  ViewController.swift
//  单例模式
//
//  Created by Lei Zhao on 1/19/18.
//  Copyright © 2018 Lei Zhao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        DispatchQueue.global().async {
            let person1 = Person.sharedPerson
            print("\(person1)-----\(Thread.current)")
        }
        
        DispatchQueue.global().async {
            let person2 = Person.sharedPerson
            print("\(person2)-----\(Thread.current)")
        }
        
    }

}


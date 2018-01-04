//
//  ViewController.swift
//  plist
//
//  Created by Lei Zhao on 1/3/18.
//  Copyright © 2018 Lei Zhao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func save(_ sender: UIButton) {
        let documentPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString
        let arrayPath = documentPath.appendingPathComponent("data.plist")
        print(arrayPath)
        let array = NSArray(array: ["aaa", "bbbb"])
        array.write(toFile: arrayPath, atomically: true)
        
        let dict = NSDictionary(dictionary: ["name": "Lei", "age": 10])
        let dictPath = documentPath.appendingPathComponent("dict.plist")
        dict.write(toFile: dictPath, atomically: true)
    }
    
    @IBAction func read(_ sender: UIButton) {
        let documentPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString
        let arrayPath = documentPath.appendingPathComponent("data.plist")
        let dictPath = documentPath.appendingPathComponent("dict.plist")
        
        let array = NSArray(contentsOfFile: arrayPath)
        let dict = NSDictionary(contentsOfFile: dictPath)
        
        print(array!)
        print(dict!)
    }
    
    
}


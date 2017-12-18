//
//  ViewController.swift
//  UILabel
//
//  Created by Lei Zhao on 12/18/17.
//  Copyright © 2017 Lei Zhao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        let label = UILabel(frame: CGRect(x: 100, y: 100, width: 200, height: 175))
        label.backgroundColor = UIColor.red
        label.font = UIFont.systemFont(ofSize: 17)
        label.textAlignment = .center
        label.text = "test string!!!test string!!!test string!!!test string!!!test string!!!test string!!!test string!!!"
        
        label.textColor = UIColor.white
        
        label.shadowColor = UIColor.black
        label.shadowOffset = CGSize(width: -2, height: 1)
        
        label.numberOfLines = 0
        
        /*
         case byWordWrapping // Wrap at word boundaries, default
         
         case byCharWrapping // Wrap at character boundaries
         
         case byClipping // Simply clip
         
         case byTruncatingHead // Truncate at head of line: "...wxyz"
         
         case byTruncatingTail // Truncate at tail of line: "abcd..."
         
         case byTruncatingMiddle // Truncate middle of line:  "ab...yz"
         */
        label.lineBreakMode = .byWordWrapping
        
        self.view.addSubview(label)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


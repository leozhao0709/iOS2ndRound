//
//  ViewController.swift
//  pieChart
//
//  Created by Lei Zhao on 1/7/18.
//  Copyright © 2018 Lei Zhao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var drawView: DrawView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.drawView.dataArray = [25, 25, 50]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        print(#function)
        self.drawView.setNeedsDisplay()
    }
    
}


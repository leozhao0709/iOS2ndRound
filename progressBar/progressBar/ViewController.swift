//
//  ViewController.swift
//  progressBar
//
//  Created by Lei Zhao on 1/7/18.
//  Copyright © 2018 Lei Zhao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var progressView: ProgressView!
    @IBOutlet weak var label: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func slide(_ sender: UISlider) {
//        print(sender.value)
        
        self.progressView.percentage = CGFloat(sender.value)
        self.label.text = String(format: "%.2f%%", sender.value * 100)
    }
    
}


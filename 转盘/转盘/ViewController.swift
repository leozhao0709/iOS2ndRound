//
//  ViewController.swift
//  转盘
//
//  Created by Lei Zhao on 1/14/18.
//  Copyright © 2018 Lei Zhao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    weak var wheelView: WheelView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let wheelView = WheelView.loadWheelView()
        wheelView.center = self.view.center
        self.view.addSubview(wheelView)
        self.wheelView = wheelView
    }

    @IBAction func startRotate(_ sender: UIButton) {
        self.wheelView?.startRotate()
    }
    
    @IBAction func stopRotate(_ sender: UIButton) {
        self.wheelView?.pauseRotate()
    }
    
}


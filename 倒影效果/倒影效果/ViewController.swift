//
//  ViewController.swift
//  倒影效果
//
//  Created by Lei Zhao on 1/16/18.
//  Copyright © 2018 Lei Zhao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var topImageView: UIImageView!
    @IBOutlet weak var bottomImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.bottomImageView.layer.transform = CATransform3DMakeRotation(CGFloat.pi, 1, 0, 0)
        self.bottomImageView.layer.opacity = 0.5
    }


}


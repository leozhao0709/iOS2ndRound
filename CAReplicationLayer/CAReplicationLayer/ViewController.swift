//
//  ViewController.swift
//  CAReplicationLayer
//
//  Created by Lei Zhao on 1/16/18.
//  Copyright © 2018 Lei Zhao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myView: MyView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layer = CALayer()
        layer.bounds = CGRect(x: 0, y: 0, width: 30, height: 100)
        layer.anchorPoint = CGPoint(x: 0, y: 1)
        layer.position = CGPoint(x: 10, y: self.myView.bounds.height)
        layer.backgroundColor = UIColor.red.cgColor
        self.myView.layer.addSublayer(layer)
        
        let repliLayer = self.myView.layer as! CAReplicatorLayer
        repliLayer.instanceCount = 5
        repliLayer.instanceTransform = CATransform3DMakeTranslation(45, 0, 0)
    }


}


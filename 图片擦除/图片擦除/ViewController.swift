//
//  ViewController.swift
//  图片擦除
//
//  Created by Lei Zhao on 1/9/18.
//  Copyright © 2018 Lei Zhao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.imageView.isUserInteractionEnabled = true
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(self.pan(panGesture:)))
        self.imageView.addGestureRecognizer(panGesture)
    }
    
    @objc
    private func pan(panGesture: UIPanGestureRecognizer) {
        let curPoint = panGesture.location(in: self.imageView)
        
        let clearRectWH: CGFloat = 30
        let clearRect = CGRect(x: curPoint.x - clearRectWH * 0.5, y: curPoint.y - clearRectWH * 0.5, width: clearRectWH, height: clearRectWH)
        
        UIGraphicsBeginImageContextWithOptions(self.imageView.bounds.size, false, 0)
        let ctx = UIGraphicsGetCurrentContext()
        self.imageView.layer.render(in: ctx!)

        ctx?.clear(clearRect)
        self.imageView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

